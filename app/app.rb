DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/mydatabase.db")
module Supplismo
  class App < Sinatra::Base
    helpers Sinatra::JSON
    configure :development do
      register Sinatra::Reloader
    end

    JSON_PARAMS = {:only => [:id, :text], :methods => [:status_id, :class_name]}

    get '/' do
      send_file 'app/public/index.html'
    end

    get '/stocks' do
      content_type 'application/json'
      status 200
      Stock.all.to_json(JSON_PARAMS)
    end

    post '/stocks' do
      unless params[:name].nil?
        stock = Stock.new
        stock.text = params[:name]
        stock.save
      end
    end

    get '/stocks/:id' do
      Stock.get(params[:id]).to_json(JSON_PARAMS)
    end

    put '/stocks/:id' do
      stock = Stock.get(params[:id])
      stock.status = params[:status] unless params[:status].nil?
      stock.save
    end

    delete '/stocks/:id' do
      stock = Stock.get(params[:id])
      stock.destroy
    end

    # SpecialRequest

    get '/special_requests' do
      content_type 'application/json'
      status 200
      SpecialRequest.all.to_json
    end

    post '/special_requests' do
      special_request = SpecialRequest.create(text: params['text'])
      status 201
      special_request.to_json
    end

    run! if app_file == $0
  end
end
DataMapper.finalize.auto_upgrade!
