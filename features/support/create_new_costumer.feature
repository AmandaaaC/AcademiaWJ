#language:pt
Funcionalidade: Criar novo usuário 

    Para que eu possa cadastrar um novo usuário
    Fazer cadastro com nome, sobrenome, email e senha
    Clicar em Create an account
    Serei direcionada para a página “My account” 
    e lerei a mensagem: “Thank you for registering with Main Website Store.”
    
    Cenário: Criação de usuário

        Dado que eu acesso a página de criação do usuário
        Quando eu realizo meu cadastro
        Então devo ser cadastrada com sucesso 
        

    Cenário: email inválido

        Dado que eu acesso a página de criação do usuário
        Quando eu me cadastro com 'Amanda', 'Colloca', 'amanda.colloca.webjump.com.br', 'Amanda1234' e 'Amanda1234'
        Então devo ver a seguinte mensagem: "Please enter a valid email address (Ex: johndoe@domain.com)"

    Cenário: senha diferente

        Dado que eu acesso a página de criação do usuário
        Quando eu me cadastro com 'Amanda', 'Colloca', 'amanda_colloca123@webjump.com.br', 'Amanda1234@' e 'Amandinha1235@'
        Então devo ver a seguinte mensagem: "Please enter the same value again."
    
    Cenário: senha menor

        Dado que eu acesso a página de criação do usuário
        Quando eu me cadastro com 'Amanda', 'Colloca', 'amanda.colloca@webjump.com.br', 'Amanda' e 'Amanda'
        Então devo ver a seguinte mensagem: "Minimum length of this field must be equal or greater than 8 symbols. Leading and trailing spaces will be ignored."
