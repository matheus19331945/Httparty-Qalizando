Dado('que o usuario consulte informacoes de Funcionarios') do
    @get_url = 'https://jsonplaceholder.typicode.com/users'
  end
  
  Quando('ele realizar a pesquisa') do
    @list_employee = HTTParty.get(@get_url) # Armazenando a ação do get da minha URL no HTTParty, ele permite que eu faça requisições
  end
  
  Entao('uma lista de funcionarios deve retornar') do
    expect(@list_employee.code).to eql 200 # Compara o código recebido com 200 e a mensagem
    expect(@list_employee.message).to eql 'OK'
  end

  Dado('que o usuario cadastre um novo funcionario') do
    @post_url = 'https://jsonplaceholder.typicode.com/users' # Enviando um Post
  end
  
  Quando('ele enviar as informacoes do funcionario') do
    @create_employee = HTTParty.post(@post_url, :headers => {'Content-Type': 'application/json'}, body: { # Corpo do post enviado, nesse caso informo o campo para enviar a requisição
        "name": "Matheuzinho",
        "email": "jatheus@example.com",
        "password": "123456"
  }.to_json)

  puts @create_employee

  end
  
  Entao('esse funcionaria sera cadastrado') do
    puts @create_employee.code
    puts @create_employee.message
    puts @create_employee["id"] #Printar o código, mensagem e o ID retornado no JSON, se estiver dentro de uma tag informa-lá antes, por ex. ['data'] ["employee_name"], usando o método .parsed_response para garantir que o valor será retornado em string
    #Como puxar um valor inteiro puts @create_employee["id"].to eql (11)
  end