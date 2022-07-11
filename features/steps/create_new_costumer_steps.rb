Dado('que eu acesso a página de criação do usuário') do
    visit 'https://magento.nublue.co.uk/customer/account/create'
end
  
Quando('eu realizo meu cadastro') do

    first_name=Faker::Name.first_name
    last_name=Faker::Name.last_name
    email=Faker::Internet.email
    password=Faker::Internet.unique.password(min_length: 8)

    find('#firstname').set first_name
    find('input[name=lastname]').set last_name
    find('#email_address').set email
    find('#password').set password
    find('input[name=password_confirmation]').set password
    
    click_button 'Create an Account'
end

Quando('eu me cadastro com {string}, {string}, {string}, {string} e {string}') do |first_name, last_name, email, password, password_confirmation|
    find('#firstname').set first_name
    find('input[name=lastname]').set last_name
    find('#email_address').set email
    find('#password').set password
    find('input[name=password_confirmation]').set password_confirmation
    
    click_button 'Create an Account'
    
end


  
Então('devo ser cadastrada com sucesso') do 
    expect(page).to have_text 'Thank you for registering with Main Website Store.'
end
  
