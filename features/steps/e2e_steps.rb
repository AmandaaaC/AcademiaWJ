require_relative '../support/pages/authentication'
acess_page = AuthenticationPage.new
auth_front = AuthenticationPage.new
acess_prod = Products.new
purchase_flow = Products.new
add_button = Products.new
cart = Products.new
is_in_cart = Checkout.new
ship_method = Checkout.new
place_order = Checkout.new


Dado('que eu acesso a página de login') do
    
    acess_page.acess
end

Quando('eu realizo meu login com {string}, {string}') do |valid_email, valid_password|

    auth_front.login(valid_email,valid_password)
    sleep 5
end

Dado('que eu acesso a página Jackets') do
    
    acess_prod.acess_products
end

Quando('eu seleciono o tamanho S e a cor Purple') do

    purchase_flow.add_to_cart

end

E ('clico em Add to cart') do

    add_button.click_add

end

Então ('devo visualizar um item no carrinho') do
  
    cart.cart
end


Dado ('que eu adicionei um item ao carrinho') do
    is_in_cart.is_in_cart
end    

Quando('eu preencho os dados do envio com {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}') do |email, first_name, last_name, street, country, state, city, zipcode, phone|
    ship_method.ship_method(email, first_name, last_name, street, country, state, city, zipcode, phone)
end

E ('eu clicar em place order') do
    place_order.place_order
end    

