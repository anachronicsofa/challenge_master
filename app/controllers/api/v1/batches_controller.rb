require_relative 'orders_controller.rb'

module Api
  module V1
    class BatchesController < ApplicationController 
      before_action :set_batch, only: %i[show printing_done deliver_order]
      def index
        @batch = Batch.order('created_at DESC')
        render json: @batch
      end

      def create
        @batch = Batch.new(batch_params)
        if @batch.save
          add_order
        else
          render json: @batch.errors
        end
      end

      def show
        @batch = Batch.find(params[:id])
        render json: @batch
      end

      def printing_done
        @batch.orders.update_all(status: 'closing')
      end

      def deliver_order
        if params[:delivery_service].blank?
          render json: { error: 'Empty delivery_service' }, status: 404
        else
          @batch.orders.each do |order|
            if order.delivery_service == params[:delivery_service]
              order.status = 'sent'
            end
          end
        end
      end

      private

      def set_batch
        @batch = Batch.find(params[:id])
      end

      def batch_params
        params.permit(:reference, :purchase_channel)
      end

      def add_order
        erros = []
        orders = Order.find(params[:order_id])
        orders.each do |order|
          if order.purchase_channel == @batch.purchase_channel && order.status == 'ready'
            @batch.orders << order
            order.batch_id = @batch.id
          else
            erros.push(order)
          end
        end
        @batch.orders.update_all(status: 'production')
        if erros.count != 0
          render json: { status: 'success', message: "#{@batch.reference} was created. #{@batch.orders.count} orders added to the batch. | Att: Can't be add #{erros.count} order(s) (differente purchase channel): #{erros}" }
        else
          render json: { status: 'success', message: "#{@batch.orders.count} orders added to the batch. #{@batch.orders}" }
        end
      end
    end
  end
end
