require 'rails_helper'

RSpec.describe BatchesController, type: :controller do
  it 'create batch' do
    batch = Batch.create!({ reference: 'test_reference', purchase_channel: 'iguatemi'})
    expect(batch.reference).to eq('test_reference')
    expect(batch.purchase_channel).to eq('iguatemi')
  end
end
