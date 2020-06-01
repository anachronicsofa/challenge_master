json.array! @batches do |batch|
    json.id batch.id
    json.reference batch.reference
    json.purchase_channel batch.purchase_channel
  end