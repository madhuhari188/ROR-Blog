require 'rails_helper'

RSpec.describe "ratings/show", type: :view do
  before(:each) do
    assign(:rating, Rating.create!(
      post_rating: 2,
      post_id: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
