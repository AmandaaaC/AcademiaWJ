Dado('que eu acesso a página de login') do
    visit 'https://magento.nublue.co.uk/customer/account/login/referer/aHR0cHM6Ly9tYWdlbnRvLm51Ymx1ZS5jby51ay9jdXN0b21lci9hY2NvdW50L2NyZWF0ZS8%2C/https://magento.nublue.co.uk/customer/account/create'
end

Quando('eu realizo meu login com {string}, {string}') do |email, password|
    find('#email').set email
    find('#pass').set password
    click_button 'Sign In'
end

# Então('devo ver a seguinte mensagem: {string}') do |welcome|
#     expect(page).to have welcome
# end

Dado('que eu acesso a página Jackets') do
    visit 'https://magento.nublue.co.uk/women/tops-women/jackets-women.html'
end

Quando('eu seleciono o tamanho S e a cor Purple') do
    
    find('#product-item-info_1402').click


    #find('link[href=https://magento.nublue.co.uk/adrienne-trek-jacket.html]').click_on
    
    find('#option-label-size-144-item-167').click
    find('#option-label-color-93-item-57').click
end

E ('clico em Add to cart') do
    #find('#product-addtocart-button').click_button
    find('button[title="Add to Cart"]').click

end

Então ('devo visualizar um item no carrinho') do
    #expect(page).to have_text "You added Olivia 1/4 Zip Light Jacket to your shopping cart.", wait: 5
    #assert_selector('span[class="counter-number"]')
    #page.assert_selector('span[class="counter-number"]', text: "1", visible: true)
    
    #expect(find('span[class="counter-number"]', wait: 10).text).to eq "1"
    #assert_no_selector('div[class="loader"]')
    assert_selector('span[class="counter-number"]')
    expect(find('span[class="counter-number"]')).to have_text "1"
    
    #within([class='counter-number']
    #expect('counter-number').to have_text "1"
end


Dado ('que eu adicionei um item ao carrinho') do
    visit 'https://magento.nublue.co.uk/women/tops-women/jackets-women.html'
    find('#product-item-info_1402').click
    find('#option-label-size-144-item-167').click
    find('#option-label-color-93-item-57').click
    find('button[title="Add to Cart"]').click
    expect(page).to have_text "You added Olivia 1/4 Zip Light Jacket to your shopping cart."
  
    find('span[class="counter qty"]').click

   
    #assert_selector('div[id="minicart-content-wrapper"]')
    sleep 1 #melhorar pq o Eric é exigente demais
    find('button[id="top-cart-btn-checkout"]').click
    
    #find('div[class="primary"]').click_button
    #find('button[title="Proceed to Checkout"]').click_button
    #sleep 3
    #find('div[data-bind="html: getCartParamUnsanitizedHtml("extra_actions")"]').click
    #find('button[class="action primary checkout"]').click_button
    assert_no_selector('div[class="loader"]', wait: 10)
    #assert_selector('div[class="step-title"]')
    within '#shipping' do
        expect(find('div[class="step-title"]')).to have_text "Shipping Address"
    end
end    

#Quando ('eu procedo ao checkout') do 
    
    #expect(find('span[class="counter-number"]')).to have_text "1", wait:10
    
  #  binding.pry
   # find('a[class="action showcart active"]').click
    
    #find('button[title="Proceed to Checkout"]').click_button
    


#end

Quando('eu preencho os dados do envio com {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}') do |email, first_name, last_name, street, country, state, city, zipcode, phone|


#Quando ('eu preencho os dados do envio com {String}, {String}, {String}, {String}, {String}, {String}, {String}, {String}, {String}') do |email, first_name, last_name, street, country, state, city, zipcode, phone|
    #assert_selector('div[class="step-title"]')
    #expect(find('div[class="step-title"]')).to have_text "Shipping Address", wait:5
    
    find('#customer-email').set email
    find('input[name="firstname"]').set first_name
    find('input[name="lastname"]').set last_name
    find('input[name="street[0]').set street
    #select "Brazil", from: 'select[name="country_id"]'
    find('select[name="country_id"]').select country
    find('select[name="region_id"]').select state
    find('input[name="city"]').set city
    find('input[name="postcode"]').set zipcode
    find('input[name="telephone"]').set phone
    find('input[name="ko_unique_3"]').choose
    #find('button[class="button action continue primary"]').click_button
    click_on "Next"
end

E ('eu clicar em place order') do
    assert_no_selector('div[class="loader"]')
    #assert_selector('span[data-bind="i18n: Order Summary"]')
#binding.pry
    
    #find('button[class="action primary checkout"]').click_on

    click_on "Place Order"
    sleep 8
end    

# #Então ('devo ver a mensagem: {string}') do |string|
#     assert_no_selector('div[class="loader"]')
#     #expect(page).to have_text "Thank you for your purchase!"
#     #find('span[class="base"]', wait: 6).to have_content "Thank you for your purchase!"
    
#     expect(page).to have_content string
# end
