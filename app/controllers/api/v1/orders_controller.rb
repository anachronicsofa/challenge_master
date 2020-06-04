module Api
  module V1
    class OrdersController < ApplicationController
      before_action :set_order, only: %i[show update destroy]
      def index
        @orders = Order.order('created_at DESC')
        render json: @orders
      end

      def create
        @order = Order.new(order_params)
        @order.status = 'ready'
        if @order.save
          render json: @order
        else
          render json: @order.errors, status: :unprocessable_entity
        end
      end

      def show
        @order = Order.find(params[:id])
        render json: @order
      end

      def show_status_by_name
        if params[:client_name].blank?
          render json: { error: 'Empty client name' }, status: 404
        else
          @orders = Order.where('client_name like ?', "%#{params[:client_name]}%")
          render json: @orders
        end
      end

      def show_closing_order_by_purchase_ch
        if params[:purchase_ch].blank?
          render json: { error: 'Empty purchase channel' }, status: 404
        else
          @orders = Order.where('client_name like ?', "%#{params[:purchase_channel]}%", status: :closing)
          render json: @orders
        end
      end

      def update
        if @order.update(order_params)
          render json: @order
        else
          render json: @order.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @order.destroy
      end

      private

      def set_order
        @order = Order.find(params[:id])
      end

      def order_params
        params.require(:order).permit(:reference, :client_name, :purchase_channel, :address, :delivery_service, :total_value, :line_items)
      end
    end
  end
end
