require 'rails_helper'

RSpec.describe "ProCons", :type => :request do
  describe "GET /pro_cons" do
    it "works! (now write some real specs)" do
      get pro_cons_path
      expect(response).to have_http_status(200)
    end
  end
end
