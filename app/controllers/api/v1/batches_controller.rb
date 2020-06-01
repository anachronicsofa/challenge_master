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

      def add_order_to_a_batch(orders)
        batch.n_orders = 0
        orders.each do |order| 
          if (order.purchase_channel==batch.purchase_channel && order.status=="ready")
            batch.orders << order    
            order.batch.id = @batch.id
            order.status = 'production'
            n_orders +=1
          else
            erros=[]
            erros.push(order)
          end
        end
        if erros.count != 0 
          puts "ERROR! Cannot add this orders: #{erros}"
        end
      puts "Number of Orders: #{n_orders}"
      render json: batch.orders
    end

      def printing_done
        @batch.orders.status = 'closing'
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
