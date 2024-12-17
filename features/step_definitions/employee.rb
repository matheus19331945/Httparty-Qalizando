Dado('que o usuario consulte informacoes de Funcionarios') do
    @getlist = Employee_Requests.new
    @asserts = Assertions.new
  end
  
  Quando('ele realizar a pesquisa') do
    # Armazenando a informação do meu get na variável, para moder manipular depois
    @list_employee = @getlist.find_employee
  end
  
  Entao('uma lista de funcionarios deve retornar') do
    @asserts.request_success(@list_employee.code, @list_employee.message) # Compara o código recebido com 200 e a mensagem
  end

  Dado('que o usuario cadastre um novo funcionario') do
    @create = Employee_Requests.new
    #Em vez de usar um database também podemos utilizar a gem faker comentada abaixo
    @asserts = Assertions.new
  end
  
  Quando('ele enviar as informacoes do funcionario') do
    @create_employee = @create.create_employee(DATABASE[:name][:name6],DATABASE[:email][:email6])
    #Data base para facilitar a inclusao das massas de dados
    puts @create_employee
  end
  
  Entao('esse funcionaria sera cadastrado') do
    @asserts.request_success(@create_employee.code, @create_employee.message) # Compara o código recebido com 200 e a mensagem
    expect(@create_employee["id"]) #Printar o código, mensagem e o ID retornado no JSON, se estiver dentro de uma tag informa-lá antes, por ex. ['data'] ["employee_name"], usando o método .parsed_response para garantir que o valor será retornado em string
    #Como puxar um valor inteiro puts @create_employee["id"].to eql (11)
    expect(@create_employee["name"]).to eql DATABASE[:name][:name6]
    expect(@create_employee['email']).to eql DATABASE[:email][:email6]
  end

# Alternativa caso não queira manipular os dados utilizando o database
=begin
  Dado('que o usuario cadastre um novo funcionario') do
    @create = Employee_Requests.new
    @name =  Faker::Name.name
    @email = Faker::Internet.email
    puts @name
    puts @email
  end
  
  Quando('ele enviar as informacoes do funcionario') do
    @create_employee = @create.create_employee(@name, @email)
    puts @create_employee
  end
  
  Entao('esse funcionaria sera cadastrado') do
    expect(@create_employee.code).to eql (201)
    expect(@create_employee.message).to eql 'Created'
    expect(@create_employee["id"])
    expect(@create_employee["name"]).to eql @name
    expect(@create_employee['email']).to eql @email
  end
=end

  Dado('que o usuario altere uma informacao de funcionario') do
    @request = Employee_Requests.new
    @asserts = Assertions.new
  end
  
  Quando('ele enviar as novas informacoes') do
    @update_employee = @request.update_employee(@request.find_employee[0]['id'], 'Matheus', 'matheus@example.com')
    puts @update_employee
  end
  
  Entao('as informacoes serao alteradas') do
    @asserts.request_success(@update_employee.code, @update_employee.message) # Compara o código recebido com 200 e a mensagem
    expect(@update_employee['id']).to eql 1
  end


  Dado('que o usuario queira deletar um funcionario') do
    @request = Employee_Requests.new
  end
  
  Quando('ele enviar a identificacao unica') do
    @delete_employee = @request.delete_employee(@request.find_employee[0]['id'])
  end
  
  Entao('esse funcionario sera deletado do sistema') do
    @asserts.request_success(@delete_employee.code, @delete_employee.message) # Compara o código recebido com 200 e a mensagem
  end