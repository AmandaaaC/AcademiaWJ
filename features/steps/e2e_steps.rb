Dado('que eu acesso a página de login') do
    
    visit 'https://magento.nublue.co.uk/customer/account/login/referer/aHR0cHM6Ly9tYWdlbnRvLm51Ymx1ZS5jby51ay9jdXN0b21lci9hY2NvdW50L2NyZWF0ZS8%2C/https://magento.nublue.co.uk/customer/account/create'
end

Quando('eu realizo meu login com {string}, {string}') do |email, password|
    
    find('#email').set email
    find('#pass').set password
    click_button 'Sign In'
end

Dado('que eu acesso a página Jackets') do
    
    visit 'https://magento.nublue.co.uk/women/tops-women/jackets-women.html'
end

Quando('eu seleciono o tamanho S e a cor Purple') do
    
    find('#product-item-info_1402').click    
    find('#option-label-size-144-item-167').click
    find('#option-label-color-93-item-57').click
end

E ('clico em Add to cart') do
 
    find('button[title="Add to Cart"]').click
end

Então ('devo visualizar um item no carrinho') do
  
    assert_selector('span[class="counter-number"]')
    expect(find('span[class="counter-number"]')).to have_text "1"
end


Dado ('que eu adicionei um item ao carrinho') do
    visit 'https://magento.nublue.co.uk/women/tops-women/jackets-women.html'
    find('#product-item-info_1402').click
    find('#option-label-size-144-item-167').click
    find('#option-label-color-93-item-57').click
    find('button[title="Add to Cart"]').click
    expect(page).to have_text "You added Olivia 1/4 Zip Light Jacket to your shopping cart."
    find('span[class="counter qty"]').click
    sleep 1
    find('button[id="top-cart-btn-checkout"]').click
    assert_no_selector('div[class="loader"]', wait: 10)
    within '#shipping' do
        expect(find('div[class="step-title"]')).to have_text "Shipping Address"
    end
end    

Quando('eu preencho os dados do envio com {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}') do |email, first_name, last_name, street, country, state, city, zipcode, phone|
  
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

E ('eu clicar em place order') do
    assert_no_selector('div[class="loader"]')
  
    click_on "Place Order"
    sleep 8
end    

