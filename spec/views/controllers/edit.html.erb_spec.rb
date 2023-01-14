require 'rails_helper'

RSpec.describe "controllers/edit", type: :view do
  let(:controller) {
    Controller.create!(
      Cataloges: "MyString"
    )
  }

  before(:each) do
    assign(:controller, controller)
  end

  it "renders the edit controller form" do
    render

    assert_select "form[action=?][method=?]", controller_path(controller), "post" do

      assert_select "input[name=?]", "controller[Cataloges]"
    end
  end
end
