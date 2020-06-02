require 'rails_helper'
require 'rspec/rails'
require 'batches_controller.rb'

RSpec.describe OrdersController, type: :controller do
  it 'create order properly' do
    order = Order.create!({ reference: 'test_reference', client_name: 'Name',
                            purchase_channel: 'iguatemi',
                            address: 'rua alguma coisa', delivery_service: 'rappi',
                            total_value: '42', line_items: 'fsadaga'})
    expect(order.reference).to eq('test_reference')
    expect(order.purchase_channel).to eq('iguatemi')
    expect(order.address).to eq('rua alguma coisa')
    expect(order.delivery_service).to eq('rappi')
    expect(order.total_value).to eq('42')
    expect(order.line_items).to eq('fsadaga')
  end
end





#rspec ./spec/requests/get_orders_spec.rb
# expect(order.show_status_by_name('Name')).to eq(order)