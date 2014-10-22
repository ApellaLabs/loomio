require 'rails_helper'

RSpec.describe "pro_cons/new", :type => :view do
  before(:each) do
    assign(:pro_con, ProCon.new(
      :body => "MyText",
      :user_id => 1
    ))
  end

  it "renders new pro_con form" do
    render

    assert_select "form[action=?][method=?]", pro_cons_path, "post" do

      assert_select "textarea#pro_con_body[name=?]", "pro_con[body]"

      assert_select "input#pro_con_user_id[name=?]", "pro_con[user_id]"
    end
  end
end
