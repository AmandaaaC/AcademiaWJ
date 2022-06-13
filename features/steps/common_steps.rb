Então('devo ver a seguinte mensagem: {string}') do |mensagem|
    expect(page).to have_content mensagem
end
