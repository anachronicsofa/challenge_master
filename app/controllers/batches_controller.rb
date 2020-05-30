class BatchesController < ApplicationController
  before_action :set_batch, only: [:show, :update, :destroy]

  def index
    @batches = Batch.all
    render json: @batches
  end

  def show
    render json: @batch
  end

  def create
    @batch = Batch.new(batch_params)

    if @batch.save
      render json: @batch, status: :created, location: @batch
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
