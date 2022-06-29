Algoritmo "Cadastro de Equipamentos - CELPE"
// Disciplina   : [Lógica Matemática]
// Professor   : Bruno Rocha 
// Autor(a)    :
// Data atual  : 06/2022

  tipo
    Equip = registro
      Tomb: caractere
      Fab: caractere
      Pote: caractere
      Local: caractere
    fimregistro
var
  opcao: inteiro
  cadastrarNovoEquip: caractere
  enter: caractere
  Equips: vetor[1..1000] de Equip
  posicao: inteiro
  i: inteiro
  TombAleat: inteiro

  //Função para gerar Tombamento do Equipamento
  funcao gerarTomb(): caractere
  inicio
    aleatorio on
    aleatorio 1000, 9999
    leia(TombAleat)
    aleatorio off
    retorne "PDE."+Numpcarac(TombAleat)
  fimfuncao

  //Função para verificar se o Equipamento já existe
  //retorna 0 caso não exista e a posição do Equipamento
  //caso encontrado
  funcao EquipJaExiste(Tomb: caractere): inteiro
  var
    posicaoEquip: inteiro
  inicio
    posicaoEquip := 0

    para i de 1 ate posicao faca
      se (Equips[i].Tomb = Tomb) entao
        posicaoEquip := i
      fimse
    fimpara

    retorne posicaoEquip
  fimfuncao

  //Imprimir cabeçalho do sistema
  procedimento imprimirCabecalho()
  inicio
    escreval("+++++++++++++++++++++++++++++++++++++++++++++++++")
    escreval("      SISTEMA DE CADASTRO DE EQUIPAMENTOS")
    escreval("+++++++++++++++++++++++++++++++++++++++++++++++++")
    escreval("")
    escreval("")
    escreval("")
  fimprocedimento

  //Listar Equipamentos cadastrados
  procedimento listarEquip()
  inicio
    limpatela()
    imprimirCabecalho()
    escreval("Lista de Equipamentos: ")
    para i de 1 ate posicao faca
      escreval(Equips[i].Tomb)
      escreval(Equips[i].Fab)
      escreval(Equips[i].Pote)
      escreval(Equips[i].Local)
      escreval("")
    fimpara
  fimprocedimento

  //Cadastrar Equipamento no vetor [banco de cados] de Equipamentos
  procedimento cadastrarEquip()
  var
    TombGer: caractere
  inicio
    repita
       posicao := posicao + 1
       repita
         TombGer  := gerarTomb()
       ate EquipJaExiste(TombGer) = 0

       Equips[posicao].Tomb := TombGer
       limpatela()
       imprimirCabecalho()
       escreval("Tombamento gerado: ", Equips[posicao].Tomb)
       escreva("Informe o fabricante do equipamento: ")
       leia(Equips[posicao].Fab)
       escreva("Informe a potência do equipamento: ")
       leia(Equips[posicao].Pote)
       escreva("Informe o bairro do equipamento: ")
       leia(Equips[posicao].Local)
       escreval("")
       escreval("Equipamento cadastrado com sucesso!!")
       escreval("")
       escreval("")
       escreva("Deseja cadastrar outro Equipamento (S) sim | (N) Não: ")
       leia(cadastrarNovoEquip)
    ate (cadastrarNovoEquip <> "S") e (cadastrarNovoEquip <> "s")
  fimprocedimento

  //Consultar e listar Equipamentos
  procedimento consultarEquip()
  var
    TombInf: caractere
    posicaoEquip: inteiro
  inicio
    limpatela()
    imprimirCabecalho()
    escreva("Informe o Tombamento do Equipamento: ")
    leia(TombInf)
    posicaoEquip := EquipJaExiste(TombInf)

    se (posicaoEquip > 0) entao
      limpatela()
      imprimirCabecalho()
      escreval("*******************************************")
      escreval("Dados do Equipamento:")
      escreval("*******************************************")
      escreval("Tombamento: ", Equips[posicaoEquip].Tomb)
      escreval("Fabricante: ",      Equips[posicaoEquip].Fab)
      escreval("Potencia: ",      Equips[posicaoEquip].Pote)
      escreval("Bairro: ",      Equips[posicaoEquip].Local)
    senao
      escreval("")
      escreva("Nenhum Equipamento encontrado para o tombamento informado.")
      escreval("")
    fimse
  fimprocedimento

  //Consultar e alterar dados de um aluno
  procedimento alterarEquip()
  var
    TombInf: caractere
    posicaoEquip: inteiro
    simOuNao: caractere
  inicio
    limpatela()
    imprimirCabecalho()
    escreva("Informe o Tombamento do Equipamento: ")
    leia(TombInf)
    posicaoEquip := EquipJaExiste(TombInf)

    se (posicaoEquip > 0) entao
      limpatela()
      imprimirCabecalho()
      escreval("##########################################")
      escreval("Dados do Equipamento:")
      escreval("##########################################")
      escreval("Tombamento: ", Equips[posicaoEquip].Tomb)
      escreval("Fabricante: ",      Equips[posicaoEquip].Fab)
      escreval("Potencia: ",      Equips[posicaoEquip].Pote)
      escreval("Bairro: ",      Equips[posicaoEquip].Local)

      //Modificando ou não o Fabricante do Equipamento
      escreval("")
      escreval("")
      escreva("Deseja modificar o FABBRICANTE do Equipamento (S=sim | N=Não)? ")
      leia(simOuNao)
      se (simOuNao = "S") ou (simOuNao = "s") entao
        escreva("Informe o Fabricante do Equipamento: ")
        leia(Equips[posicaoEquip].Fab)
      fimse

      //Modificando ou não o Potencia do Equipamento
      escreva("Deseja modificar a Potencia do Equipamento (S=sim | N=Não)? ")
      leia(simOuNao)
      se (simOuNao = "S") ou (simOuNao = "s") entao
        escreva("Informe o Poencia do Equipamento: ")
        leia(Equips[posicaoEquip].Pote)
      fimse
      
      //Modificando ou não o Bairro/Localidade do Equipamento
      escreva("Deseja modificar a Localidade do Equipamento (S=sim | N=Não)? ")
      leia(simOuNao)
      se (simOuNao = "S") ou (simOuNao = "s") entao
        escreva("Informe o Bairro do Equipamento: ")
        leia(Equips[posicaoEquip].Local)
      fimse
    senao
      escreval("")
      escreva("Nenhum Equipamento encontrado para o tombamento informado.")
      escreval("")
    fimse
  fimprocedimento

  //Limpar os dados do Equipamento
  procedimento limparDadosEquip(posicaoEquip: inteiro)
  inicio
    Equips[posicaoEquip].Tomb := ""
    Equips[posicaoEquip].Fab := ""
    Equips[posicaoEquip].Pote := ""
    Equips[posicaoEquip].Local := ""
  fimprocedimento

  //Consulta e posterior exclusão (ou não) de um aluno
  //reorganização do meu vetor, conforme registro excluído
  procedimento excluirEquip()
  var
    TombInf: caractere
    posicaoEquip: inteiro
    simOuNao: caractere
  inicio
    limpatela()
    imprimirCabecalho()
    escreva("Informe o tombamento do Equipamento: ")
    leia(TombInf)
    posicaoEquip := EquipJaExiste(TombInf)

    se (posicaoEquip > 0) entao
      limpatela()
      imprimirCabecalho()
      escreval("-----------------------------------------")
      escreval("Dados do Equipamento:")
      escreval("-----------------------------------------")
      escreval("Tombamento: ", Equips[posicaoEquip].Tomb)
      escreval("Fabricante: ",      Equips[posicaoEquip].Fab)
      escreval("Potencia: ",      Equips[posicaoEquip].Pote)
      escreval("Bairro: ",      Equips[posicaoEquip].Local)
      escreval("")
      escreva("Deseja realmente excluir o equipamento supracitado (S=sim | N=Não)? ")
      leia(simOuNao)

      se (simOuNao = "S") ou (simOuNao = "s") entao
        para i de posicaoEquip ate posicao-1 faca
          Equips[i] := Equips[i+1]
        fimpara

        limparDadosEquip(posicao)
        posicao := posicao - 1
        escreval("")
        escreva("Equipamento excluído com sucesso do registro!")
        escreval("")
      fimse
    senao
      escreval("")
      escreva("Nenhum Equipamento encontrado para o tombamento informado.")
      escreval("")
    fimse
  fimprocedimento

  //Ordena os alunos alfabeticamente, utilizando o algoritmo
  //bubble sort
  procedimento ordenaEquips()
  var
    trocouDePosicao: logico
    i: inteiro
    aux: caractere
    numMaximo: inteiro
  inicio
    numMaximo := posicao - 1
    repita
       trocouDePosicao := falso
       para i de 1 ate numMaximo faca
         se (Equips[i].Fab > Equips[i+1].Fab) entao
           aux := alunos[i].Fab
           Equips[i].nome := Equips[i+1].Fab
           Equips[i+1].Fab := aux
           trocouDePosicao := verdadeiro
         fimse
       fimpara
       numMaximo := numMaximo - 1
     ate trocouDePosicao = falso
  fimprocedimento
inicio
  posicao := 0
  repita
     limpatela()
     imprimirCabecalho()
     escreval("Informe a opção desejada:")
     escreval("1. Cadastrar Equipamentos")
     escreval("2. Listar Equipamentos")
     escreval("3. Consultar Equipamento")
     escreval("4. Alterar Equipamento")
     escreval("5. Excluir Equipamento")
     escreval("9. Sair do sistema")
     escreval("")
     escreval("")
     escreva("Opção: ")
     leia(opcao)
     escolha(opcao)
       caso 1
          cadastrarEquip()
       caso 2
          ordenaEquips()
          listarEquip()
       caso 3
         consultarEquip()
       caso 4
         alterarEquip()
       caso 5
         excluirEquip()
       caso 9
          escreval("Grupo Celpe agradece a sua parceria, juntos geramos energia.")
       outrocaso
          escreval("Opção inválida")
     fimescolha
     escreval("")
     escreval("Pressione ENTER para continuar")
     leia(enter)
  ate opcao = 9
fimalgoritmo