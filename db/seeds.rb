User.delete_all
Item.delete_all
Order.delete_all
OrderItem.delete_all

# //create user through web site

10.times do
  item = Item.create({
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.words(4)
    })
  order = Order.create({
    status:1,
    user_id:1
    })
  OrderItem.create({
    order_id: order.id,
    item_id: item.id
    })
end
