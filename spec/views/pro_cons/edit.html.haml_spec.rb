require 'rails_helper'

RSpec.describe "pro_cons/edit", :type => :view do
  before(:each) do
    @pro_con = assign(:pro_con, ProCon.create!(
      :body => "MyText",
      :user_id => 1
    ))
  end

  it "renders the edit pro_con form" do
    render

    assert_select "form[action=?][method=?]", pro_con_path(@pro_con), "post" do

      assert_select "textarea#pro_con_body[name=?]", "pro_con[body]"

      assert_select "input#pro_con_user_id[name=?]", "pro_con[user_id]"
    end
  end
end
