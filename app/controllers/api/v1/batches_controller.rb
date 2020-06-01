require_relative "orders_controller.rb"

module Api
  module V1
    class BatchesController < ApplicationController 


      def index
        @batch = Batch.order('created_at DESC');
        render json: @batch
      end

      def create
        @batch = Batch.new(batch_params)
        if @batch.save
          render json: @batch
        else
          render json: @batch.errors
        end
      end

      def printing_done
        @batch.orders.status = "closing"
      end

      def delivery_order(delivery_service)
        @batch.orders.each do |order|
          if order.delivery_service == delivery_service
            order.status = 'sent'
          end
        end 
      end

      private

      def batch_params
        params.permit(:reference, :purchase_channel)
      end
    end
  end 
end
