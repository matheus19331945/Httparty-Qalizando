class Assertions
    def request_success(code, message)
        expect([200, 201]).to include(code)  # Verifica se status_code é 200 ou 201
        expect(['OK', 'Created']).to include(message)  # Verifica se message é 'OK' ou 'Created'
    end
end