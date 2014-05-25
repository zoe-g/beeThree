require 'spec_helper'

describe 'product' do

  before(:each) do      
    @product = Product.create(name: "sofa", description: "used couch, some stains", price: 50, image_url: "http://i.imgur.com/A6nmz.jpg")
  end

  it 'should create a new instance of Product if given valid attributes' do
    @product.should be_valid
  end

  describe 'name' do

    it 'should have a name' do
      @product.name = nil
      @product.should_not be_valid
    end

    it 'should be at least two characters' do
      @product.name = "a"
      @product.should_not be_valid
    end

  end

  describe 'description' do

    it 'should have a description' do
      @product.description = nil
      @product.should_not be_valid
    end

    it 'should be at least two characters' do
      @product.description = "a"
      @product.should_not be_valid
    end

  end

  describe 'price' do

    it 'should have a price' do
      @product.price = nil
      @product.should_not be_valid
    end

    it 'should be an integer' do
      @product.price = 50.8
      @product.should_not be_valid
    end

    it 'should be an integer' do
      @product.price = 'fifty'
      @product.should_not be_valid
    end

    it 'should be accept zero' do
      @product.price = 0
      @product.should be_valid
    end

    it 'should be greater than or equal to zero' do
      @product.price = -1
      @product.should_not be_valid
    end

    it 'should be less than three thousand' do
      @product.price = 3001
      @product.should_not be_valid
    end

  end

end
