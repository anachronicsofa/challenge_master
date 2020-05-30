module Api
  module V1
    class BatchesController < ApplicationController
      def index
        @batches = Batch.order('created_at DESC')
        render json: @batches
      end

      def show
        batches = Batch.find(params[:id])
        render json: { status: 'SUCCESS', message: 'Loaded batch', data: batches }, status: :ok
      end

      def create
        @batch = Batch.new(batch_params)
        if @batch.save
          render json: { status: 'SUCCESS', message: 'Saved batch', data: @batch }, status: :ok
        else
          render json: @batch.errors, status: :unprocessable_entity
        end
      end

      def update
        if @batch.update(batch_params)
          render json: @batch
        else
          render json: @batch.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @batch.destroy
      end

      private

      def set_batch
        @batch = Batch.find(params[:id])
      end

      def batch_params
        params.require(:batch).permit(:reference, :purchase_channel)
      end
    end
  end
end
