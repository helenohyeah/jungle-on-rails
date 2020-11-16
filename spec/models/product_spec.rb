require 'rails_helper'

RSpec.describe Product, type: :model do

  let(:category) {Category.new(name: 'Gardening')}
  let(:product) {Product.new(
    name: 'Garden Gnome',
    price: 29.99,
    quantity: 5,
    category_id: category.id
  )}

  describe 'Validations' do

    context "All fields valid" do
      it "saves successfully given a product with all fields filled" do
        category.save
        expect{product.save}.to change{Product.count}.by(1)
      end
    end

    context "Missing fields" do
      it "returns error if the name field is nil" do
        category.save
        product.name = nil
        product.save
        expect(product).to_not be_valid
        expect(product.errors.full_messages).to eq ["Name can't be blank"]
      end
  
      it "returns error if the price field is nil" do
        category.save
        product.price_cents = nil
        product.save
        expect(product).to_not be_valid
        expect(product.errors.full_messages).to include "Price can't be blank"
      end
  
      it "returns error if the quantity field is nil" do
        category.save
        product.quantity = nil
        puts product.inspect
        product.save
        expect(product).to_not be_valid
        expect(product.errors.full_messages).to eq ["Quantity can't be blank"]
      end
      
      it "returns error if the category field is nil" do
        product.save
        expect(product).to_not be_valid
        expect(product.errors.full_messages).to eq ["Category can't be blank"]
      end
    end


  end
  
end
