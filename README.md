# Stork
___
Ruby on Rails ecommerce platform hosted through Amazon Web Services.
Designed and developed over week long sprint in a group of four developers.

### URL: [storkstore.us](http://www.storkstore.us)

### Features
* Users can access their cart items across machines
* Guest users can view items, add items to cart
* Responsive display

### Technologies Used
_____
- HTML / CSS / SASS
- JavaScript / jQuery
- Amazon Web Services
- RSpec
- Ruby on Rails 
- Materialize
- Stripe
- Devise
- Paperclip

## Code Examples
___

```Ruby
# Order#order_total ensures total prices are accurately calculated for both
# current carts, and past orders - regardless of changes to item price
def order_total
    if open?
      order_items.map { |oi| oi.item[:price] * oi[:quantity].to_f }.reduce(0.0, :+)
    else
      order_items.map { |oi| oi[:purchase_price] * oi[:quantity].to_f }.reduce(0.0, :+)
    end
  end
```

```Ruby
# Order#merge is called when a user has added items to the cart and then logs in
def merge(order)
    return if id == order.id
    order.order_items.each do |oi|
      oi.order_id = id
      order_items.push(oi)
    end
    save
    order.delete
  end
```

### Screenshots
___
Main Page

![Index](http://i.imgur.com/BywLCeN.png)

Cart

![Cart Page](http://i.imgur.com/tVBoFtW.png)

Item Page
![Item Show](http://i.imgur.com/rNH2uZC.png)


## Planning
___
![](https://dl.dropboxusercontent.com/s/flnrhwhdt9rcxzm/final.jpg?dl=0)

### User Flow:
- User can add items to a cart without being logged in
- When logged in, 
	* User can view their profile page and past orders
	* User must be logged-in in order to checkout
	* User can enter credit card information to finalize purchase and view receipt upon completion of payment
	
![](https://dl.dropboxusercontent.com/s/rg29eh3d8k0b7qz/wire1.jpg?dl=0)

### Home Page:
- User can browse for candy on the home page
- User can add a specific candy to the cart by adding the 'Add to Cart' button
- User can specify the quantity of that candy to be added
- User can sign up for a store account via the 'Sign Up' button
- User can log in to their store account in the Nav Bar
- User can store their address (to be accessed when shipping is implemented)
- User can see how much stock remains for a certain item

![](https://dl.dropboxusercontent.com/s/zhdyljbetf1s4ub/landing.jpg?dl=0)
![](https://dl.dropboxusercontent.com/s/csavv4zetnle1l3/signup.jpg?dl=0)
![](https://dl.dropboxusercontent.com/s/v67nsze6qoju44m/user.jpg?dl=0)

### Item Page:

- User can view Item name, description, stock, image
- User can add Item to cart via the 'Add to Card' button
- User can view a list of other items offered by the store
- User can go back to main store page via the 'Back' button

![](https://dl.dropboxusercontent.com/s/tfjjtnce48wrq55/item.jpg?dl=0)

### Cart Page:
- User can view a summary of their order
- User can view the item's page by clicking on the item name
- User can edit the amount of each item or remove item from cart
- User can empty the full cart via 'Trash' button
- User can proceed to checkout via 'Credit Card' button

![](https://dl.dropboxusercontent.com/s/r6fu7zsuebs4ev0/cart.jpg?dl=0)


![](https://dl.dropboxusercontent.com/s/nlqlzed32lq0k1r/checkout1.jpg?dl=0)
![](https://dl.dropboxusercontent.com/s/nur3mwjau9bx0bc/checkout2.jpg?dl=0)
![](https://dl.dropboxusercontent.com/s/ijugblorecnrtbi/checkout3.jpg?dl=0)

### Future Work:

- Mail confirmation for purchases, signup
- PDF receipts
- User login via omniauth
- Users can edit profiles
- Add item categories, brands - for searching

