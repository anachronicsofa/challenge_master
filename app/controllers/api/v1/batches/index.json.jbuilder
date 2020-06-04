json.array! @batches do |batch|
  json.id batch.id
  json.reference batch.reference
  json.purchase_channel batch.purchase_channel
  json.batch.orders.count batch.orders.count
  json.orders do
    json.id batch.orders.id
    json.reference batch.orders.reference
    json.status batch.orders.status
  end
end
