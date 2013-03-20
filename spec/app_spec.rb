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

describe 'stocks API' do
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

describe 'special_request API', :type => :api do
  context 'list of special requests' do
    before {
      @sr = Supplismo::SpecialRequest.create(text: 'Kielbasa')
    }

    let(:url) { '/special_requests' }
    specify do
      get "#{url}"

      requests_json = Supplismo::SpecialRequest.all.to_json
      last_response.status.should eql(200)
      last_response.body.should eql(requests_json)
      requests = JSON.parse(last_response.body)
      requests.any? { |r| r["text"] == "Kielbasa" }.should be_true
    end
  end

  context 'creating a request' do
    before :all do
      Supplismo::SpecialRequest.destroy
    end
    let(:url) { '/special_requests' }
    specify {
      post url, {text: 'YerbaMate'}
      special_request = Supplismo::SpecialRequest.first(text: 'YerbaMate')

      last_response.status.should eq(201)
      last_response.body.should eq(special_request.to_json)
    }
  end
end
