# Jungle

A mini e-commerce application built with Ruby on Rails 4.2.

Tested using RSPEC, Capybara (using Poltergeist as a driver)

## Features
User:
- Add products to cart
- Purchase products (using Stripe)
- Sold out badge when products are out of stock
- Create an account and login

Admin:
- secured with HTTP basic authentication (user: Jungle, password: book)
- Dashboard showing product quantities and categories
- Add new products
- Add new categories

## Screenshots

View all products from the home page
![Home page](https://github.com/helenohyeah/jungle-rails/blob/master/docs/home-page.png?raw=true)
Add items to cart and purchase with a credit card (powered by Stripe) and view your order confirmation
![My cart page](https://github.com/helenohyeah/jungle-rails/blob/master/docs/my-cart.png?raw=true)
![Order confirmation page](https://github.com/helenohyeah/jungle-rails/blob/master/docs/order-confirmation.png?raw=true)

### Admin Portal
View quantities of products
![Admin dashboard page](https://github.com/helenohyeah/jungle-rails/blob/master/docs/admin-dashboard.png?raw=true)
Create new products and categories
![Admin create new product page](https://github.com/helenohyeah/jungle-rails/blob/master/docs/admin-new-product.png?raw=true)


## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe