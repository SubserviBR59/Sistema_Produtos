"""Aqui a versao em portugol do sistemas de produtos
"""

# programa
# {
#     // Dialeto: Portugol Studio. Execute este arquivo no Portugol Studio.
#     // Vetores paralelos: o mesmo índice representa o mesmo produto.
#     // Informe números válidos; use ponto decimal no Portugol Studio.
#     cadeia nomes[100], categorias[100], categorias_unicas[100]
#     real precos[100]
#     cadeia nomes_decrescentes[100], categorias_decrescentes[100]
#     real precos_decrescentes[100]
#     real estatisticas[3]
#     inteiro quantidade
#
#     funcao inicio()
#     {
#         inteiro i, j, quantidade_categorias = 0, quantidade_filtrados = 0
#         inteiro tipo_filtro = 0
#         real valor_limite = 0.0, soma_precos = 0.0, preco_auxiliar
#         cadeia nome_auxiliar, categoria_auxiliar
#         logico repetida
#
#         escreva("SISTEMA DE PRODUTOS - SPRINT 4\n")
#         escreva("Quantidade de produtos (0 a 100): ")
#         leia(quantidade)
#         enquanto (quantidade < 0 ou quantidade > 100)
#         {
#             escreva("Informe uma quantidade de 0 a 100: ")
#             leia(quantidade)
#         }
#
#         // CADASTRO: posições fixas substituem append() de uma lista.
#         para (i = 0; i < quantidade; i++)
#         {
#             escreva("\nProduto ", i + 1, "\nNome: ")
#             leia(nomes[i])
#             enquanto (nomes[i] == "")
#             {
#                 escreva("Nome obrigatório: ")
#                 leia(nomes[i])
#             }
#             escreva("Preço (R$): ")
#             leia(precos[i])
#             enquanto (precos[i] < 0.0 ou precos[i] > 1000000000.0)
#             {
#                 escreva("Preço entre 0 e 1000000000: ")
#                 leia(precos[i])
#             }
#             escreva("Categoria: ")
#             leia(categorias[i])
#             enquanto (categorias[i] == "")
#             {
#                 escreva("Categoria obrigatória: ")
#                 leia(categorias[i])
#             }
#         }
#
#         se (quantidade > 0)
#         {
#             escreva("\nValor para o filtro (R$): ")
#             leia(valor_limite)
#             enquanto (valor_limite < 0.0 ou valor_limite > 1000000000.0)
#             {
#                 escreva("Valor entre 0 e 1000000000: ")
#                 leia(valor_limite)
#             }
#             enquanto (tipo_filtro != 1 e tipo_filtro != 2)
#             {
#                 escreva("Filtro: 1 - acima; 2 - abaixo: ")
#                 leia(tipo_filtro)
#             }
#         }
#
#         // RELATÓRIO: escreva() substitui a formatação com f-strings.
#         escreva("\n========== RELATÓRIO FINAL ==========\n")
#         escreva("Quantidade: ", quantidade, "\n\nORDEM DE CADASTRO\n")
#         para (i = 0; i < quantidade; i++)
#         {
#             escreva(nomes[i], " | R$ ", precos[i], " | ", categorias[i], "\n")
#         }
#         se (quantidade == 0)
#         {
#             escreva("Nenhum produto cadastrado.\n")
#         }
#
#         // FILTRO: preços iguais ao limite não entram em nenhum filtro.
#         se (tipo_filtro == 1)
#         {
#             escreva("\nACIMA DE R$ ", valor_limite, "\n")
#         }
#         senao
#         {
#             escreva("\nABAIXO DE R$ ", valor_limite, "\n")
#         }
#         para (i = 0; i < quantidade; i++)
#         {
#             se ((tipo_filtro == 1 e precos[i] > valor_limite) ou
#                 (tipo_filtro == 2 e precos[i] < valor_limite))
#             {
#                 escreva(nomes[i], " | R$ ", precos[i], " | ", categorias[i], "\n")
#                 quantidade_filtrados++
#             }
#         }
#         se (quantidade_filtrados == 0)
#         {
#             escreva("Nenhum produto encontrado.\n")
#         }
#
#         // BOLHA CRESCENTE: altera os vetores originais, como sort().
#         // Troca os três campos para preservar a identidade do produto.
#         para (i = 0; i < quantidade - 1; i++)
#         {
#             para (j = 0; j < quantidade - 1 - i; j++)
#             {
#                 se (precos[j] > precos[j + 1])
#                 {
#                     preco_auxiliar = precos[j]
#                     precos[j] = precos[j + 1]
#                     precos[j + 1] = preco_auxiliar
#                     nome_auxiliar = nomes[j]
#                     nomes[j] = nomes[j + 1]
#                     nomes[j + 1] = nome_auxiliar
#                     categoria_auxiliar = categorias[j]
#                     categorias[j] = categorias[j + 1]
#                     categorias[j + 1] = categoria_auxiliar
#                 }
#             }
#         }
#         escreva("\nPREÇO CRESCENTE\n")
#         para (i = 0; i < quantidade; i++)
#         {
#             escreva(nomes[i], " | R$ ", precos[i], " | ", categorias[i], "\n")
#             // Copia os dados: equivalente a criar outra lista com sorted().
#             nomes_decrescentes[i] = nomes[i]
#             precos_decrescentes[i] = precos[i]
#             categorias_decrescentes[i] = categorias[i]
#         }
#
#         // BOLHA DECRESCENTE: usa cópias; não altera os vetores crescentes.
#         para (i = 0; i < quantidade - 1; i++)
#         {
#             para (j = 0; j < quantidade - 1 - i; j++)
#             {
#                 se (precos_decrescentes[j] < precos_decrescentes[j + 1])
#                 {
#                     preco_auxiliar = precos_decrescentes[j]
#                     precos_decrescentes[j] = precos_decrescentes[j + 1]
#                     precos_decrescentes[j + 1] = preco_auxiliar
#                     nome_auxiliar = nomes_decrescentes[j]
#                     nomes_decrescentes[j] = nomes_decrescentes[j + 1]
#                     nomes_decrescentes[j + 1] = nome_auxiliar
#                     categoria_auxiliar = categorias_decrescentes[j]
#                     categorias_decrescentes[j] = categorias_decrescentes[j + 1]
#                     categorias_decrescentes[j + 1] = categoria_auxiliar
#                 }
#             }
#         }
#         escreva("\nPREÇO DECRESCENTE\n")
#         para (i = 0; i < quantidade; i++)
#         {
#             escreva(nomes_decrescentes[i], " | R$ ", precos_decrescentes[i],
#                 " | ", categorias_decrescentes[i], "\n")
#         }
#
#         // CONJUNTO MANUAL: só adiciona uma categoria ainda não encontrada.
#         // A comparação é exata, como no set de strings do Python:
#         // "Livros" e "livros" são categorias diferentes.
#         para (i = 0; i < quantidade; i++)
#         {
#             repetida = falso
#             para (j = 0; j < quantidade_categorias; j++)
#             {
#                 se (categorias[i] == categorias_unicas[j])
#                 {
#                     repetida = verdadeiro
#                 }
#             }
#             se (nao repetida)
#             {
#                 categorias_unicas[quantidade_categorias] = categorias[i]
#                 quantidade_categorias++
#             }
#         }
#         escreva("\nCATEGORIAS ÚNICAS (", quantidade_categorias, ")\n")
#         para (i = 0; i < quantidade_categorias; i++)
#         {
#             escreva("- ", categorias_unicas[i], "\n")
#         }
#
#         // ESTATÍSTICAS: laços e comparações substituem min, max e sum.
#         // Portugol Studio não possui tupla imutável. O vetor estatisticas
#         // agrupa [menor, maior, média]; após o cálculo, só fazemos leitura.
#         // Isso é uma convenção; o vetor NÃO é realmente imutável.
#         se (quantidade > 0)
#         {
#             estatisticas[0] = precos[0]
#             estatisticas[1] = precos[0]
#             para (i = 0; i < quantidade; i++)
#             {
#                 se (precos[i] < estatisticas[0])
#                 {
#                     estatisticas[0] = precos[i]
#                 }
#                 se (precos[i] > estatisticas[1])
#                 {
#                     estatisticas[1] = precos[i]
#                 }
#                 soma_precos = soma_precos + precos[i]
#             }
#             estatisticas[2] = soma_precos / quantidade
#             escreva("\nMenor preço: R$ ", estatisticas[0], "\n")
#             escreva("Maior preço: R$ ", estatisticas[1], "\n")
#             escreva("Média: R$ ", estatisticas[2], "\n")
#         }
#         senao
#         {
#             escreva("\nSem produtos: não há estatísticas para calcular.\n")
#         }
#     }
# }
