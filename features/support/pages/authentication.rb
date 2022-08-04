class AuthenticationPage
include Capybara::DSL

    def login(valid_email, valid_password)
        find('#email').set valid_email
        find('#pass').set valid_password
        click_button 'Sign In'
      
    end
 
end

