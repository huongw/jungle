require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
    # SETUP
    before :each do
      @category = Category.create! name: 'Apparel'
  
      10.times do |n|
        @category.products.create!(
          name:  Faker::Hipster.sentence(3),
          description: Faker::Hipster.paragraph(4),
          quantity: 10,
          price: 64.99
        )
      end
    end

    scenario "Cart increments to 1 when 'Add to Cart' is clicked on product" do
      # ACT
      visit root_path

      first('article.product').find_button('Add').trigger('click')
  
      # puts page.html
  
      # VERIFY
       expect(page).to have_content 'My Cart (1)'

      # DEBUG 
      save_screenshot
    end
end