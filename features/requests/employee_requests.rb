class Employee_Requests

    def find_employee
        Employee.get('/users') #Chamando o módulo criado e atribuindo o final da URL no get (metodo reservado do httpary)
    end

    def create_employee(name, email)    
        #Mesma coisa do Get, só que com o post
        Employee.post('/users', body:{
            "name": name,
            "email": email,
            }.to_json)
    end

    def update_employee(id, name, email)
        Employee.put('/users/' + id.to_s, body: {
            "name": name,
            "email": email,  
        }.to_json)
    end

    def delete_employee(id)
        Employee.delete('/users/' + id.to_s)
    end
    
end


