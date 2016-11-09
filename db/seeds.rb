OrderItem.destroy_all
Order.destroy_all
User.destroy_all
Item.destroy_all

items = [
  {name: "hershey's chocolate bar" , description: "milk chocolate bar, 1.55 ounces" , price: 1.99 , stock: 20, image: File.new(Rails.root.to_s + "/app/assets/images/hershey.png")},
  {name: "Nerds" , description: "Bite size colorful flavorful sour snaps, 1.55 ounces" , price: 1.99 , stock: 20, image: File.new(Rails.root.to_s + "/app/assets/images/green_licorice.jpg")},
  {name: "Green Apple Licorice" , description: "15 pieces tastes like a real apple" , price: 6.99 , stock: 20, image: File.new(Rails.root.to_s + "/app/assets/images/hersheys_twizzlers_watermelon.png")},
  {name: "Watermelon Licorice" , description: "15 pieces tastes like a real watermelon" , price: 6.99 , stock: 20, image: File.new(Rails.root.to_s + "/app/assets/images/cherry_licorice.png")},
  {name: "Cherry Licorice" , description: "15 pieces tastes like a real cherry" , price: 6.99 , stock: 20, image: File.new(Rails.root.to_s + "/app/assets/images/hershey.png")},
  {name: "Blue Rasberry Licorice" , description: "15 pieces tastes like a real reasberry" , price: 6.99 , stock: 20, image: File.new(Rails.root.to_s + "/app/assets/images/blue-licorice.jpg")},
  {name: "nerds rope" , description: "direct from the wonka factory, made of nerds and joy, 1.55 ounces" , price: 1.99 , stock: 20, image: File.new(Rails.root.to_s + "/app/assets/images/nerds.jpg")},
  {name: "apple heads" , description: "apple crunch drops" , price: 1.99 , stock: 20, image: File.new(Rails.root.to_s + "/app/assets/images/apple_heads.jpg")},
  {name: "haribo gumy bears" , description: "the original gummy bear, THE ORIGINAL" , price: 2.99 , stock: 20, image: File.new(Rails.root.to_s + "/app/assets/images/haribo.jpg")},
  {name: "sour gummy worms" , description: "stringy sour and sweet strands of goodness" , price: 2.99 , stock: 20, image: File.new(Rails.root.to_s + "/app/assets/images/sour-gummy-worms.jpg")},
  {name: "sour watemelon slices" , description: "sour patch kids sour melon slices" , price: 2.99 , stock: 20, image: File.new(Rails.root.to_s + "/app/assets/images/Sour_Patch_Watermelon_Slices.jpg")},
  {name: "warheads" , description: "20 pieces an assortment of flavors, guaranteed to make you cry" , price: 2.99 , stock: 20, image: File.new(Rails.root.to_s + "/app/assets/images/warheads.jpg")},
  {name: "sour strips" , description: "10 strips per package, intense sour flavor" , price: 3.99 , stock: 20, image: File.new(Rails.root.to_s + "/app/assets/images/sour_strips.jpg")},
  {name: "butterfinger" , description: "milk chocolate bar w/ peanut butter crunch" , price: 0.99 , stock: 20, image: File.new(Rails.root.to_s + "/app/assets/images/butterfinger.jpg")},
  {name: "m&ms" , description: "milk chocolate pices w/ peanut center" , price: 0.99 , stock: 20, image: File.new(Rails.root.to_s + "/app/assets/images/mms.jpg")},
  {name: "snickers" , description: "milk chocolate bar, 1.55 ounces" , price: 0.99 , stock: 20, image: File.new(Rails.root.to_s + "/app/assets/images/snickers.png-large")},
  {name: "twix" , description: "milk chocolate bar, 1.55 ounces" , price: 0.99 , stock: 20, image: File.new(Rails.root.to_s + "/app/assets/images/twix.png")},
  {name: "mango hi-chew" , description: "fruit chew" , price: 1.29 , stock: 20, image: File.new(Rails.root.to_s + "/app/assets/images/mango-hi-chew.png")},
  {name: "green apple hi-chew" , description: "fruit chew" , price: 1.29 , stock: 20, image: File.new(Rails.root.to_s + "/app/assets/images/apple-hi-chew.png")},
  {name: "cherry hi-chew" , description: "fruit chew" , price: 1.29 , stock: 20, image: File.new(Rails.root.to_s + "/app/assets/images/cherry-hi-chew.png")},
  {name: "grape hi-chew" , description: "fruit chew" , price: 1.29 , stock: 20, image: File.new(Rails.root.to_s + "/app/assets/images/Hi-Chew-Grape.jpg")},
  {name: "jelly belly jelly beans" , description: "assorted all 49 flavors" , price: 14.99 , stock: 20, image: File.new(Rails.root.to_s + "/app/assets/images/jellybelly.jpg")},
  {name: "starburst" , description: "5 flavor soft chews" , price: 1.29 , stock: 20, image: File.new(Rails.root.to_s + "/app/assets/images/starburst.jpeg")},
  {name: "skittles" , description: "bite size fruit crunchies witha  soft center" , price: 1.29 , stock: 20, image: File.new(Rails.root.to_s + "/app/assets/images/skittles.jpg")},
  {name: "ghirardelli milk chocolate with caramel filling squares" , description: "milk chocolate bar, 1.55 ounces" , price: 9.99 , stock: 20, image: File.new(Rails.root.to_s + "/app/assets/images/ghirardelli.jpg")}
]

Item.create(items)


sherri = User.create({first_name:"sherri" , last_name:"admin", email:"sherri@admin.com" ,password: "123456", full_address: Faker::Address.street_address + Faker::Address.city + Faker::Address.state + Faker::Address.zip.to_s + Faker::Address.country })
brenden = User.create({first_name:"brenden", last_name:"admin", email:"chris@admin.com" ,password:"123456"  , full_address: Faker::Address.street_address + Faker::Address.city + Faker::Address.state + Faker::Address.zip.to_s + Faker::Address.country })
chris =   User.create({first_name:"chirs", last_name:"admin", email:"chris@admin.com" ,password: "123456" , full_address: Faker::Address.street_address + Faker::Address.city + Faker::Address.state + Faker::Address.zip.to_s + Faker::Address.country }) 
alivia =   User.create({first_name:"alivia", last_name:"admin", email:"alivia@admin.com" ,password: "123456", full_address: Faker::Address.street_address + Faker::Address.city + Faker::Address.state + Faker::Address.zip.to_s + Faker::Address.country }) 


5.times do 
  Order.create({user_id: sherri.id, status: 1})
end

5.times do 
  Order.create({user_id: brenden.id, status: 1})
end

5.times do 
  Order.create({user_id: chris.id, status: 1})
end

5.times do 
  Order.create({user_id: alivia.id, status: 1})
end

200.times do
  OrderItem.create({order_id: rand(1..20), item_id: rand(1..23)})
end
