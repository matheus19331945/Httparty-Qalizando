module Employee #Estabelecendo a URL padrão para que não seja necessário repetição (esse método está sendo chamado)
    include HTTParty
    base_uri 'https://jsonplaceholder.typicode.com'
    format :json
    headers 'Content-Type': 'application/json'
end

#Caso a API utilize token a parte do headers ficaria assim:
#    headers 'Content-Type': 'application/json', 'Authorization': 'Bearer Valor do Token'

# Caso a API utilize toke dinamico
=begin
    include HTTParty
    @token = HTTParty.post("URL da API de TOKEN")
    base_uri 'https://jsonplaceholder.typicode.com'
    format :json
 headers 'Content-Type': 'application/json', 'Authorization': 'Bearer ' = @token.parserd_resonse['Campo do Response que retorna o token']
end
=end