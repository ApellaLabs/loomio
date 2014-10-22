require 'rails_helper'

RSpec.describe "pro_cons/index", :type => :view do
  before(:each) do
    assign(:pro_cons, [
      ProCon.create!(
        :body => "MyText",
        :user_id => 1
      ),
      ProCon.create!(
        :body => "MyText",
        :user_id => 1
      )
    ])
  end

  it "renders a list of pro_cons" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
