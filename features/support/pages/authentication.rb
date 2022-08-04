class AuthenticationPage
include Capybara::DSL

    def acess
        visit 'https://magento.nublue.co.uk/customer/account/login/referer/aHR0cHM6Ly9tYWdlbnRvLm51Ymx1ZS5jby51ay9jdXN0b21lci9hY2NvdW50L2NyZWF0ZS8%2C/https://magento.nublue.co.uk/customer/account/create'
    end
    
    def login(valid_email, valid_password)
        find('#email').set valid_email
        find('#pass').set valid_password
        click_button 'Sign In'
      
    end
 
end

