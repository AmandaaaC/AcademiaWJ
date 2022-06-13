#language:pt
Funcionalidade: teste E2E

    Para que eu possa realizar um teste E2E
    Fazer login com email e senha
    Escolher um produto
    e proceder ao checkout
    
    Cenário: Autenticação de usuário

        Dado que eu acesso a página de login
        Quando eu realizo meu login com 'amanda@webjump.com.br', 'Amanda123@@'
        Então devo ver a seguinte mensagem: "Welcome, Amanda Colloca!"
    
    Cenário: Escolher um produto

        Dado que eu acesso a página Jackets
        Quando eu seleciono o tamanho S e a cor Purple
        E clico em Add to cart
        Então devo visualizar um item no carrinho
    
    Cenário: Proceder ao checkout

        Dado que eu adicionei um item ao carrinho
        Quando eu preencho os dados do envio com 'amanda@webjump.com.br', 'Amanda', 'Colloca', 'Rua Marilia, 179', 'Brazil', 'São Paulo', 'São Paulo', '12606-170', '11996950270'
        E eu clicar em place order
        Então devo ver a seguinte mensagem: "Thank you for your purchase!"