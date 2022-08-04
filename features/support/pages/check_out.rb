class Checkout
include Capybara::DSL


    def is_in_cart

        visit 'https://magento.nublue.co.uk/women/tops-women/jackets-women.html'
        find('#product-item-info_1402').click
        find('#option-label-size-144-item-167').click
        find('#option-label-color-93-item-57').click
        find('button[title="Add to Cart"]').click
        sleep 3
        page.has_content? "You added Olivia 1/4 Zip Light Jacket to your shopping cart."
        find('span[class="counter qty"]').click
        sleep 1
        find('button[id="top-cart-btn-checkout"]').click
        assert_no_selector('div[class="loader"]', wait: 10)
        within '#shipping' do
            page.has_content? "Shipping Address"
        end
    end

    def ship_method (email, first_name, last_name, street, country, state, city, zipcode, phone)
        find('#customer-email').set email
        find('input[name="firstname"]').set first_name
        find('input[name="lastname"]').set last_name
        find('input[name="street[0]').set street
        find('select[name="country_id"]').select country
        find('select[name="region_id"]').select state
        find('input[name="city"]').set city
        find('input[name="postcode"]').set zipcode
        find('input[name="telephone"]').set phone
        find('input[name="ko_unique_3"]').choose
       
        click_on "Next"    
    end

    def place_order

        assert_no_selector('div[class="loader"]')
          click_on "Place Order"
        sleep 8
    end

end