require 'rails_helper'

RSpec.describe "controllers/index", type: :view do
  before(:each) do
    assign(:controllers, [
      Controller.create!(
        Cataloges: "Cataloges"
      ),
      Controller.create!(
        Cataloges: "Cataloges"
      )
    ])
  end

  it "renders a list of controllers" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Cataloges".to_s), count: 2
  end
end
