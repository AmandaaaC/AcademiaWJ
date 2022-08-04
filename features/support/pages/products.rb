class Products
include Capybara::DSL

    def acess_products

    visit 'https://magento.nublue.co.uk/women/tops-women/jackets-women.html'
    end

    def add_to_cart

        find('#product-item-info_1402').click    
        find('#option-label-size-144-item-167').click
        find('#option-label-color-93-item-57').click
        
    end

    def click_add

        find('button[title="Add to Cart"]').click
    end

    def cart
          
        page.has_css?('span[class="counter-number"]')
     
    end
    
end