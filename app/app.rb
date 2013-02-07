module Provider
  class App < Sinatra::Base
    helpers Sinatra::JSON

    get '/stocks' do
      json [{text:'Kawa', status:"empty"},
            {text:'Papier toaletowy', status:"medium"},
            {text:'Woda', status:"whole"}]
    end

    run! if app_file == $0
  end
end
