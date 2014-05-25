require 'spec_helper'

describe Product do
  
  it 'should create a new instance of Product if given valid attributes' do
      Product = Product.create(name: "sofa", description: "used couch, some stains", price: 50, image_url: "http://i.imgur.com/A6nmz.jpg")
      Product.should be_valid
  end

  it 'should have a name' do
    Product = Product.create(description: "used couch, some stains", price: 50, image_url: "http://i.imgur.com/A6nmz.jpg")
      Product.should_not be_valid
  end

end
