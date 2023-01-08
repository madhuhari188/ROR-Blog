require 'rails_helper'

RSpec.describe "tags/edit", type: :view do
  let(:tag) {
    Tag.create!(
      tag: "MyString"
    )
  }

  before(:each) do
    assign(:tag, tag)
  end

  it "renders the edit tag form" do
    render

    assert_select "form[action=?][method=?]", tag_path(tag), "post" do

      assert_select "input[name=?]", "tag[tag]"
    end
  end
end
