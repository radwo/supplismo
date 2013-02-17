DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/mydatabase.db")
module Provider
  class App < Sinatra::Base
    helpers Sinatra::JSON
    configure :development do
      register Sinatra::Reloader
    end

    get '/stocks' do
      Stock.all.to_json(:only => [:id, :text], :methods => [:status])
    end

    post '/stocks' do
      stock = Stock.new
      stock.text = params[:name]
      stock.save
    end

    delete '/stocks' do
      Stock.all.destroy
    end

    put '/stocks/:id' do
      stock = Stock.get(params[:id])
      stock.status = params[:status]
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

    STATUS = ["empty", "medium", "whole"]

    property :id, Serial
    property :text, String
    property :status_id, Integer, :default => 0

    def status
      STATUS[status_id]
    end

    def status=(status)
      self.status_id = STATUS.index(status)
    end
  end
end
DataMapper.finalize.auto_upgrade!
