# shop-app
![](https://github.com/Brikky/shop-app/blob/master/public/ShopApp2.gif)

## Description
* Please refere to about page:
 - [Link to Heroku](https://stork-store.herokuapp.com/)
 
 ---------------------------------------------------------------------------------------------------
## Technologies:

- HTML / CSS/ SASS
- JavaScript/jQuery
- Materialize
- Ruby on Rails 
- Stripe( for payment )
- Devise
- Paperclip
- Rspec ( for testing )

## Milestones
 1. Items/ Orders
 2. Items/ Orders/ Payments
 3. Items/ Orders/ Payments/ Quantity
 4. Items/ Orders/ Payments/ Quantity/ Users/ Location
 
 
## Schema:
![](https://dl.dropboxusercontent.com/s/flnrhwhdt9rcxzm/final.jpg?dl=0)




## Wireframes and User Stories:

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


## Future Work:

adding features:
- Mail confirmation
- PDF for receipe 
- Finishing the OmniAuth
- Add edit profile feature for users
- Adding categories and brands
- Adding order by price feature


[Project Requirements and Description](https://github.com/sf-wdi-gaia/project-03#project-planning-deliverables)
