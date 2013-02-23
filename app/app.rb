DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/mydatabase.db")
module Supplismo
  class App < Sinatra::Base
    helpers Sinatra::JSON
    configure :development do
      register Sinatra::Reloader
    end

    JSON_PARAMS = {:only => [:id, :text], :methods => [:status, :class_name]}

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

    delete '/stocks' do
      Stock.all.destroy
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

    run! if app_file == $0
  end

  class Stock
    include DataMapper::Resource

    property :id, Serial
    property :text, String
    property :status_id, Integer, :default => 0

    def class_name
      class_names[status_id] if (0..2).include?(status_id)
    end

    def status
      status_names[status_id] if (0..2).include?(status_id)
    end

    def status=(status)
      self.status_id = status_names.index(status)
    end

    private
    def status_names
      ["empty", "medium", "whole"]
    end

    def class_names
      ["bar-danger", "bar-warning", "bar-success"]
    end
  end
end
DataMapper.finalize.auto_upgrade!
