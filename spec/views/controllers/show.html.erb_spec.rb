require 'rails_helper'

RSpec.describe "controllers/show", type: :view do
  before(:each) do
    assign(:controller, Controller.create!(
      Cataloges: "Cataloges"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Cataloges/)
  end
end
