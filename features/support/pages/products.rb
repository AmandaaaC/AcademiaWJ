class Products
include Capybara::DSL

    def add_to_cart

        find('#product-item-info_1402').click    
        find('#option-label-size-144-item-167').click
        find('#option-label-color-93-item-57').click
        
    end
    
end