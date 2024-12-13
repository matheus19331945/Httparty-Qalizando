# language: pt

Funcionalidade: Pesquisar Funcionarios
    Para averiguar iformacoes
    O usuario do sistema
    Deseja poder consultar informacoes dos Funcionarios

    @cenario_um
    Cenario: Buscar informacoes de funcionario
        Dado que o usuario consulte informacoes de Funcionarios
        Quando ele realizar a pesquisa 
        Entao uma lista de funcionarios deve retornar

    @cenario_dois
    Cenario: Cadastrar funcionario
        Dado que o usuario cadastre um novo funcionario
        Quando ele enviar as informacoes do funcionario
        Entao esse funcionaria sera cadastrado

