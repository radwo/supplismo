require 'spec_helper.rb'

describe 'site' do
  it "page ok" do
    get "/"
    last_response.should be_ok
  end

  it "content" do
    get "/"
    last_response.body.should include('<html ng-app="stock">')
  end
end

describe 'API' do
  before {
    Supplismo::Stock.all.destroy
  }

  describe 'GET stocks' do
    before {
      @stock = Supplismo::Stock.create(text: 'text', status_id: 0)
      get '/stocks'
    }

    it { last_response.should be_ok }
    it { last_response.body.should include(@stock.to_json(Supplismo::App::JSON_PARAMS)) }
  end

  describe 'POST stocks' do
    it {
      Supplismo::Stock.count.should be == 0
      post '/stocks', { name: 'text' }
      Supplismo::Stock.count.should be == 1
      Supplismo::Stock.first.text.should be == 'text'
    }
  end

  describe 'GET stocks/:id' do
    before {
      @stock = Supplismo::Stock.create(text: 'text', status_id: 0)
      get "/stocks/#{@stock.id}"
    }

    it { last_response.should be_ok }
    it { last_response.body.should be == @stock.to_json(Supplismo::App::JSON_PARAMS) }
  end

  describe 'PUT stocks/:id' do
    it {
      stock = Supplismo::Stock.create(text: 'text', status_id: 0)
      put "/stocks/#{stock.id}", { status: 'medium' }
      Supplismo::Stock.first.reload.status_id.should be == 2
    }
  end

  describe 'DELETE stocks/:id' do
    it {
      stock = Supplismo::Stock.create(text: 'text', status_id: 0)
      Supplismo::Stock.count.should be == 1
      delete "/stocks/#{stock.id}"
      Supplismo::Stock.count.should be == 0
    }
  end
end
