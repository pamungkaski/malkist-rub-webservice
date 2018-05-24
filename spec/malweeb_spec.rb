require 'malweeb'
require 'rack/test'

describe 'Malweeb' do
  include Rack::Test::Methods

  def app
    Malweeb.new
  end
  it 'should return ok when accesing directions-matrix api' do
    get '/api/directions-matrix'

    expect(last_response).to be_ok
  end
end
