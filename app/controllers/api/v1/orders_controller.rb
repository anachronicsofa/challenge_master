module Api
  module V1
    class OrdersController < ApplicationController
     
      def index
        @orders = Order.order('created_at DESC')
        render json: @orders
      end

      def show
	      @order = Order.find(params[:id])
			  render json: {status: 'SUCCESS', message:'Loaded order', data:@order},status: :ok
      end

      def create
        @order = Order.new(order_params)
          if @order.save
            render json: @order, status: :created, location: @order
          else
            render json: @order.errors, status: :unprocessable_entity
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
          params.require(:order).permit(:reference, :client_name, :purchase_channel, :address, :delivery_service, :total_value, :line_items, :status, :batch_id)
      end
    end
  end
end 