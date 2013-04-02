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
      Stock.get(params[:id].to_i).to_json(JSON_PARAMS)
    end

    put '/stocks/:id' do
      s = JSON.parse(request.body.read.to_s)
      stock = Stock.get(params[:id].to_i)
      stock.status = s['status'] unless s['status'].nil?
      stock.save
      stock.to_json(JSON_PARAMS)
    end

    delete '/stocks/:id' do
      stock = Stock.get(params[:id].to_i)
      stock.destroy
    end

    # SpecialRequest

    get '/requests' do
      content_type 'application/json'
      status 200
      requests = SpecialRequest.all
      requests.count > 0 ? requests.to_json : "[]"
    end

    post '/requests' do
      r = JSON.parse(request.body.read.to_s)
      unless r['text'].nil?
        special_request = SpecialRequest.create(text: r['text'])
        status 201
        special_request.to_json
      end
    end

    run! if app_file == $0
  end
end
