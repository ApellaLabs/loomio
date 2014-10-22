require 'rails_helper'

RSpec.describe "pro_cons/show", :type => :view do
  before(:each) do
    @pro_con = assign(:pro_con, ProCon.create!(
      :body => "MyText",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
  end
end
