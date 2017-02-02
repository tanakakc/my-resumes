require 'rails_helper'

RSpec.describe "static_pages/home.html.erb", type: :view do
  it "should have the content 'My Resumes'" do
    render
    expect(rendered).to match /My Resumes/
  end
end
