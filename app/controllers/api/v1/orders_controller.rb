module Api
  module V1
    class OrdersController < ApplicationController

      def index
        @orders = Order.order('created_at DESC')
        render json: @orders
      end

      def create
        @order = Order.new(order_params)
          if @order.save
            @order.status = 'ready'
            render json: @order
          else
            render json: @order.errors, status: :unprocessable_entity
          end
        end
      def show_by_id
          @order = Order.find(params[:id])
          render json: @order
      end

      def show_status_by_name(name)
        if Order.where(client_name: name).exists?
          @orders = Order.where(client_name: name)
          render json: @orders
        else
          render json: @order.errors
        end
      end

      def show_closing_order_by_purchase_ch(purchase_ch)
        @orders = Order.where(purchase_channel: purchase_ch, status: "closing")
        render json: @orders
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