require 'rails_helper'
require 'rspec/rails'

RSpec.describe Order, type: :request do
  it 'create order properly' do
    order = Order.create!({ reference: 'test_reference', client_name: 'Name',
                            purchase_channel: 'iguatemi',
                            address: 'rua alguma coisa', delivery_service: 'rappi',
                            total_value: '42', line_items: 'fsadaga'})
    expect(order.reference).to eq('test_reference')
    expect(order.purchase_channel).to eq('iguatemi')
    expect(order.total_value).to eq('42')
  end
end

