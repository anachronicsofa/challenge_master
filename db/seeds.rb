5.times do |i|
  Batch.create!(
        reference: "Lote #{i}", 
        purchase_channel: Faker::Alphanumeric.alpha(number: 10)
      )
end

10.times do |i|
  Order.create!(
        reference: "Pedido #{i}",
        client_name: Faker::Movies::HitchhikersGuideToTheGalaxy.character,
        purchase_channel: Faker::Alphanumeric.alpha(number: 10),
        address: Faker::Movies::HitchhikersGuideToTheGalaxy.location,
        delivery_service: Faker::Alphanumeric.alpha(number: 10),
        total_value: Faker::Number.number(digits: 4),
        line_items: Faker::Alphanumeric.alpha(number: 10),
        status: %w[ready production closing sent].sample,
        batch: Batch.all.sample
      )
end
