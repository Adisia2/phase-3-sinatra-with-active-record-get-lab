class ApplicationController < Sinatra::Base

  # add routes
  set :default_content_type, 'application/json'
  # GET /bakeries
  get '/bakeries' do
    # get all the bakeries from the database
    bakeries = Bakery.all
    # send them back as a JSON array
    bakeries.to_json
  end

  # GET /bakeries/:id
  get '/bakeries/:id' do
    # get the bakery with the specified id from the database
    bakery = Bakery.find(params[:id])
    # send back the bakery as JSON with its baked goods nested in an array
    bakery.to_json(include: :baked_goods)
  end

  # GET /baked_goods/by_price
  get '/baked_goods/by_price' do
    # get all the baked goods from the database and sort them by price in descending order
    baked_goods = BakedGood.order(price: :desc)
    # send them back as a JSON array
    baked_goods.to_json
  end

  # GET /baked_goods/most_expensive
  get '/baked_goods/most_expensive' do
    # get the most expensive baked good from the database
    baked_good = BakedGood.order(price: :desc).first
    # send it back as JSON
    baked_good.to_json
  end


end
