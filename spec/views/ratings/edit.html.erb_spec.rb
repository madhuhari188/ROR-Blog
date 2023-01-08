require 'rails_helper'

RSpec.describe "ratings/edit", type: :view do
  let(:rating) {
    Rating.create!(
      post_rating: 1,
      post_id: 1
    )
  }

  before(:each) do
    assign(:rating, rating)
  end

  it "renders the edit rating form" do
    render

    assert_select "form[action=?][method=?]", rating_path(rating), "post" do

      assert_select "input[name=?]", "rating[post_rating]"

      assert_select "input[name=?]", "rating[post_id]"
    end
  end
end
