json.array! @orders do |order|
    json.id order.id
    json.reference order.reference
    json.client_name order.client_name
    json.purchase_channel order.purchase_channel
    json.address order.address
    json.delivery_service order.delivery_service
    json.total_value order.total_value
    json.line_items order.line_items
    json.status order.status
        json.user do 
        json.id order.batch.id
        json.reference order.batch.reference
        end 
  end


  