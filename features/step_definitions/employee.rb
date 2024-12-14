Dado('que o usuario consulte informacoes de Funcionarios') do
    @get_url = 'https://jsonplaceholder.typicode.com/users'
  end
  
  Quando('ele realizar a pesquisa') do
    @update_employee = HTTParty.get(@get_url) # Armazenando a ação do get da minha URL no HTTParty, ele permite que eu faça requisições
  end
  
  Entao('uma lista de funcionarios deve retornar') do
    expect(@update_employee.code).to eql 200 # Compara o código recebido com 200 e a mensagem
    expect(@update_employee.message).to eql 'OK'
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


  Dado('que o usuario altere uma informacao de funcionario') do
    @get_employee = HTTParty.get('https://jsonplaceholder.typicode.com/users', :headers => {'Content-Type': 'application/json'})
    puts @get_employee[0]['id']
    @put_url = 'https://jsonplaceholder.typicode.com/users/' + @get_employee[0]['id'].to_s
  end
  
  Quando('ele enviar as novas informacoes') do
    @update_employee = HTTParty.put(@put_url, :headers => {'Content-Type': 'application/json'}, body: { # Corpo do put enviado
    "name": "Matheus Santos",
    "email": "matheus@teste.com"
    }.to_json)

    puts @update_employee
  end
  
  Entao('as informacoes serao alteradas') do
    expect(@update_employee.code).to eql 200
    expect(@update_employee.message).to eql 'OK'
    expect(@update_employee['id']).to eql 1
  end


  Dado('que o usuario queira deletar um funcionario') do
    @get_employee = HTTParty.get('https://jsonplaceholder.typicode.com/users', :headers => {'Content-Type': 'application/json'})
    puts @get_employee[0]['id']
    @delete_url = 'https://jsonplaceholder.typicode.com/users/15' + @get_employee[0]['id'].to_s 
    #Acrescentamos esse get pois não é uma boa prática fixar o id na url, de forma que as consultas serão feitas pelo primeiro
    #usuario da lista
  end
  
  Quando('ele enviar a identificacao unica') do
    @delete_employee = HTTParty.delete(@delete_url, :headers => {'Content-Type': 'application/json'})
    puts @delete_employee
  end
  
  Entao('esse funcionario sera deletado do sistema') d
    expect(@update_employee.code).to eql 200
    expect(@update_employee.message).to eql 'OK'
  end