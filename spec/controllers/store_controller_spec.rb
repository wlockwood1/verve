require 'rails_helper'

RSpec.describe StoreController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  context 'index' do
    it "returns success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'sets the instance variables' do
      get :index
      expect(controller.instance_variable_get(:@stores)).to_not be(nil)
      expect(controller.instance_variable_get(:@base_address)).to_not be(nil)
      expect(controller.instance_variable_get(:@hash)).to_not be(nil)
    end
  end

  context 'import' do
    it 'redirects to index' do

    end
    it 'flashes success message of import was successful' do
      
    end
    it 'flashes failure message if import was unsuccessful' do

    end
  end

end
