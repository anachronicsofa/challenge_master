require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get api_v1_orders_path, as: :json
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post api_v1_orders_path, params: { order: { address: @order.address, batch_id: @order.batch_id, client_name: @order.client_name, delivery_service: @order.delivery_service, line_items: @order.line_items, purchase_channel: @order.purchase_channel, reference: @order.reference, status: @order.status, total_value: @order.total_value } }, as: :json
    end

    assert_response 201
  end

  test "should show order" do
    get api_v1_order_path(@order.id), as: :json
    assert_response :success
  end

  test "should update order" do
    patch api_v1_order_path(@order.id), params: { order: { address: @order.address, batch_id: @order.batch_id, 
                                                        client_name: @order.client_name, delivery_service: @order.delivery_service,
                                                        line_items: @order.line_items, purchase_channel: @order.purchase_channel,
                                                        reference: @order.reference, status: @order.status,
                                                        total_value: @order.total_value } }, as: :json
    assert_response 200
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete api_v1_order_path(@order.id), as: :json
    end

    assert_response 204
  end
end
