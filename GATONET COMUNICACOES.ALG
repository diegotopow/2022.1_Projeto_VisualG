Algoritmo "GATONET COMUNICACOES"
//CRUD - Observado |C-Create |R-Read |U-Update |D-Delete
     tipo
         Plano = registro
         codigoPlano: inteiro
         nomePlano:caractere
         descricao:caractere
         fimregistro

         Cliente = registro
           codigoRegistro: caractere
           nome: caractere
           codigoPlano: inteiro
           fimregistro
           
Var

      opcaoMenu: inteiro
      planos: vetor[0..2] de Plano
      clientes: vetor[0..100] de Cliente
      indexInserirCliente: inteiro

      //Fun��o que chama o cabe�alho:
      procedimento apresentacaoSistema()
      inicio
      escreval("")
      escreval("*____ GATONET COMUNICACOES ____*")
      escreval("A melhor internet da regiao.")
      escreval("")
      fimprocedimento
      
      //Fun��o que chama a apresenta��o do menu:
      procedimento apresentarMenu()
      inicio
      escreval("--> MENU")
      escreval("Para continuar, escolha uma das opcoes abaixo:")
      escreval("1 - Consultar Planos")
      escreval("2 - Consultar Clientes")
      escreval("3 - Cadastrar Cliente")
      escreval("4 - Alterar Cliente")
      escreval("5 - Excluir Cliente")
      escreval("6 - Sair do Sistema")
      fimprocedimento
      
      //Fun��o que l� a op��o do usu�rio/operador
      procedimento lerOpcaoMenu()
      inicio
      escreval("")
      escreva("Digite a Opcao:")
      leia(opcaoMenu)
      se (opcaoMenu < 1) ou (opcaoMenu > 6) ENTAO //Enquanto a escolha estiver no range de 1 a 6 ele executa a op��o.
          escreval("Opcao invalida, tente novamente!")
      fimse
      fimprocedimento
      
      //Fun��o que escreve o encerramento do sistema
      procedimento finalizarSistema()
      inicio
      escreval("")
      escreval("")
      escreva("GATONET COMUNICACOES - Obrigado pela preferencia!")
      fimprocedimento
      
      //Fun��o que inicia o sistema
      procedimento inicializarSistema()
      inicio
      opcaoMenu := 0 //setting do menu para determinar a execu��o.
      indexInserirCliente:= 0 //Determina a posi��o dos dados nos seus respectivos vetores.
      criarPlanos() //Chama a fun��o para a escolha dos planos
      fimprocedimento
      
      //Fun��o que lista os planos que est�o � venda
      procedimento consultarPlanos()
      var j: inteiro
      inicio
      escreval("------------------------")
      escreval("---------Planos---------")
      escreval("------------------------")
      para j de 0 ate 2 faca //Escreve na tela O c�digo do plano, o nome do plano e a descri��o do mesmo.
           escreval(j+1," - ",planos[j].nomePlano,": ",planos[j].descricao) //J+1 serve para converter a posi��o vetorial para o visual ex: 0 para 1
      fimpara
      escreval("")
      fimprocedimento
      
      //Fun��o que declara previamente os valores, as variaveis dos vetores
      procedimento criarPlanos()
      inicio
      planos[0].codigoPlano := 0
      planos[0].nomePlano := "Basic"
      planos[0].descricao := "30MB de Internet"
      planos[1].codigoPlano := 1
      planos[1].nomePlano := "Platinum"
      planos[1].descricao := "80MB de Internet"
      planos[2].codigoPlano := 2
      planos[2].nomePlano := "Gold"
      planos[2].descricao := "120MB de Internet"
      fimprocedimento
      
      //Fun��o para cadastro dos clientes
      procedimento cadastrarCliente()
      var
         cadastrarMais: inteiro
         nomeCliente: caractere
         codigoPlano: inteiro
      inicio
      codigoPlano := 0
      cadastrarMais := 1
      escreval("------------------------")
      escreval("---Cadastrar Cliente----")
      escreval("------------------------")
      enquanto cadastrarMais = 1 faca
      
      escreva("Digite o nome:")
      leia(clientes[indexInserirCliente].nome)
      escreval("")
      enquanto (codigoPlano < 1 ) ou (codigoPlano > 3) faca
          escreval("Selecione o plano:")
          consultarPlanos() //Ap�s selecionada a fun��o desejada ser� exibida a descri��o dos planos
          escreva("Opcao:")
          leia(codigoPlano)
      fimenquanto
      clientes[indexInserirCliente].codigoPlano :=  codigoPlano - 1
      clientes[indexInserirCliente].codigoRegistro := "GT." + Numpcarac(indexInserirCliente)
      escreval("")
      escreval("Resumo:")
      escreval("Codigo de Registro: ", clientes[indexInserirCliente].codigoRegistro)
      escreval("Nome: ",clientes[indexInserirCliente].nome)
      escreval("Plano: ",planos[codigoPlano - 1].nomePlano)
      escreval("",)
      indexInserirCliente := indexInserirCliente + 1
      escreval("")
      escreva("Cadastrar outro cliente? 1 - Sim, 2- Nao Opcao:")
      leia(cadastrarMais)
      fimenquanto
      escreval("")
      escreval("Cliente cadastrado com sucesso!")
      escreval("")
      fimprocedimento
      
      //Fun��o para listar os clientes cadastrados
      procedimento consultarClientes()
      var
         j: inteiro
      inicio
      j := 0
      escreval("-------------------------")
      escreval("---------Clientes--------")
      escreval("-------------------------")
      para j de 0 ate indexInserirCliente-1 faca
      escreval("GT.",j+1," - ",clientes[j].nome,": ",planos[clientes[j].codigoPlano].nomePlano)
      fimpara
      escreval("")
      fimprocedimento
      
      //Fun��o que altera dados e/ou nome/plano escolhido
      procedimento alterarCliente()
      var
         j: inteiro
         clienteSelecionado: inteiro
         clienteAlterado: Cliente
         codigoPlano: inteiro
      inicio
      //Iniciamos com uma verifica��o para entender se h� algo � alterar
      clienteSelecionado := 0
      se indexInserirCliente = 0 entao
         escreval("")
         escreval("Ops, nenhum cliente para alterar.")
         escreval("")
      senao
         escreval("")
         escreval("##Alterar Clientes##")
         escreval("Qual cliente voce deseja alterar?")
         escreval("")
         consultarClientes()// Fun��o que listar� os clientes cadastrados para serem alterados
         
         escreval("")
         escreva("Digite qual cliente deseja alterar:")
         leia(clienteSelecionado)
         clienteSelecionado := clienteSelecionado - 1
         clienteAlterado := clientes[clienteSelecionado] //Coloca o cliente selecionado em uma vari�vel transit�ria
         escreval("Cliente Selecionado:")
         escreval(clienteSelecionado + 1," - ",clientes[clienteSelecionado].nome,": ",planos[clientes[clienteSelecionado].codigoPlano].nomePlano)
         escreval("")
         escreva("Digite o nome:") //Altera ou mant�m o mesmo nome
         leia(clienteAlterado.nome)
         enquanto (codigoPlano < 1 ) ou (codigoPlano > 3) faca
             escreval("Selecione o plano:") //Altera os mant�m o mesmo plano
             consultarPlanos() //Fun��o que ir� listar os planos para escolha do novo
             escreva("Opcao:")
             leia(codigoPlano)
         fimenquanto
         clienteAlterado.codigoPlano := codigoPlano - 1
         clientes[clienteSelecionado] := clienteAlterado //O cliente que estava na vari�vel temporaria, volta a mesma posi��o com as altera��es
         escreva("")
         escreva("Cliente Alterado com Sucesso!")
         escreva("")
      fimse
      fimprocedimento

      //Fun��o que exclui algum cliente
      procedimento excluirCliente()
      var
         clienteSelecionado: inteiro
         index: inteiro
      inicio
      clienteSelecionado := 0
      index := 0
      se indexInserirCliente = 0 entao //Condi��o que verifica se h� algum cliente para ser excluido
         escreval("")
         escreval("Ops, nenhum cliente para excluir.")
         escreval("")
      senao
         escreval("")
         escreval("**Excluir Cliente**")
         escreval("Qual cliente voce deseja excluir?")
         escreval("")
         consultarClientes() //Lista os cliente para a escolha do que ser� excluido
         escreval("")
         escreva("Digite qual cliente deseja excluir:")
         leia(clienteSelecionado)
         clienteSelecionado := clienteSelecionado - 1
         escreval("Cliente Selecionado:")
         escreval("GT",clienteSelecionado + 1," - ",clientes[clienteSelecionado].nome,": ",planos[clientes[clienteSelecionado].codigoPlano].nomePlano)
         para index de 0 ate indexInserirCliente - 1 faca
           se index = clienteSelecionado entao
             clientes[index] := clientes[index +1]
           senao
           fimse
         fimpara
         escreval("Cliente Excluido com Sucesso!")
      fimse
      fimprocedimento

Inicio
      //Chama fun��o inicializar
      inicializarSistema()
      enquanto opcaoMenu <> 6 faca
            apresentacaoSistema() //Imprime o cabe�alho na tela
            apresentarMenu() //Imprime a as op��es do menu
            lerOpcaoMenu() // Op��o para ler a op��o escolhida
            escolha(opcaoMenu)
            caso 1
                 consultarPlanos()
            caso 2
                 consultarClientes()
            caso 3
                 cadastrarCliente()
            caso 4
                 alterarCliente()
            caso 5
                 excluirCliente()
            fimescolha
      fimenquanto
      
      finalizarSistema()

Fimalgoritmo
