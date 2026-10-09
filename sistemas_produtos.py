from math import isfinite


def ler_texto(mensagem):
    """Não permite nomes ou categorias vazios."""
    while True:
        texto = input(mensagem).strip()
        if texto:
            return texto
        print(f"O campo não pode ficar vazio.")


def ler_quantidade():
    """Limite de 100 para equivalência com o vetor fixo do Portugol."""
    while True:
        try:
            quantidade = int(input("Quantidade de produtos (0 a 100): "))
            if 0 <= quantidade <= 100:
                return quantidade
        except ValueError:
            pass
        print(f"Informe um número inteiro entre 0 e 100.")


def ler_preco(mensagem):
    """Aceita vírgula ou ponto decimal, sem separador de milhares."""
    while True:
        try:
            preco = float(input(mensagem).strip().replace(",", "."))
            if isfinite(preco) and 0 <= preco <= 1_000_000_000:
                return preco
        except ValueError:
            pass
        print(f"Informe um valor de 0 a 1000000000, sem milhar.")


def cadastrar_produtos(quantidade):
    produtos = []
    for indice in range(quantidade):
        print(f"\nProduto {indice + 1}")
        nome = ler_texto("Nome: ")
        preco = ler_preco("Preço (R$): ")
        categoria = ler_texto("Categoria: ")
        produtos.append([nome, preco, categoria])
    return produtos


def filtrar_produtos(produtos, valor_limite, tipo_filtro):
    """Acima/abaixo são comparações estritas; preço igual é excluído."""
    if tipo_filtro not in ("acima", "abaixo"):
        raise ValueError("O filtro deve ser 'acima' ou 'abaixo'.")
    produtos_filtrados = []
    for produto in produtos:
        if tipo_filtro == "acima" and produto[1] > valor_limite:
            produtos_filtrados.append(produto)
        elif tipo_filtro == "abaixo" and produto[1] < valor_limite:
            produtos_filtrados.append(produto)
    return produtos_filtrados


def calcular_estatisticas(produtos):
    """Retorna uma tupla imutável (menor, maior, média), ou None."""
    if not produtos:
        return None
    precos = [produto[1] for produto in produtos]
    return (min(precos), max(precos), sum(precos) / len(precos))


def exibir_produtos(titulo, produtos):
    print(f"\n{titulo}")
    print(f"{'Nome':<25} {'Preço (R$)':>14}  {'Categoria'}")
    print(f"{'-' * 65}")
    if not produtos:
        print(f"Nenhum produto encontrado.")
    for nome, preco, categoria in produtos:
        print(f"{nome:<25} {preco:>14.2f}  {categoria}")


def emitir_relatorio(produtos, valor_limite, tipo_filtro):
    print(f"\n{'=' * 65}\nRELATÓRIO FINAL — {len(produtos)} produto(s)")
    exibir_produtos("Produtos na ordem de cadastro", produtos)
    filtrados = filtrar_produtos(produtos, valor_limite, tipo_filtro)
    exibir_produtos(
        f"Produtos {tipo_filtro} de R$ {valor_limite:.2f}", filtrados
    )

    # sort altera a lista original, que passa a estar em ordem crescente.
    produtos.sort(key=lambda produto: produto[1])
    exibir_produtos("Preço crescente — sort()", produtos)

    # sorted cria outra lista; produtos continua em ordem crescente.
    produtos_decrescentes = sorted(
        produtos, key=lambda produto: produto[1], reverse=True
    )
    exibir_produtos("Preço decrescente — sorted()", produtos_decrescentes)

    categorias_unicas = set(produto[2] for produto in produtos)
    print(f"\nCategorias únicas ({len(categorias_unicas)}):")
    # O conjunto não tem ordem; sorted organiza somente a apresentação.
    for categoria in sorted(categorias_unicas):
        print(f"- {categoria}")

    estatisticas = calcular_estatisticas(produtos)
    if estatisticas is not None:
        menor_preco, maior_preco, media_precos = estatisticas
        print(f"\nMenor preço: R$ {menor_preco:.2f}")
        print(f"Maior preço: R$ {maior_preco:.2f}")
        print(f"Média dos preços: R$ {media_precos:.2f}")
        print(f"Tupla (menor, maior, média): {estatisticas}")
    else:
        print(f"\nSem produtos: não há estatísticas para calcular.")


def main():
    print(f"SISTEMA DE PRODUTOS — SPRINT 4")
    produtos = cadastrar_produtos(ler_quantidade())
    if not produtos:
        emitir_relatorio(produtos, 0, "acima")
        return
    valor_limite = ler_preco("\nValor para o filtro (R$): ")
    while True:
        tipo_filtro = input("Listar acima ou abaixo? ").strip().lower()
        if tipo_filtro in ("acima", "abaixo"):
            break
        print(f"Digite acima ou abaixo.")
    emitir_relatorio(produtos, valor_limite, tipo_filtro)


if __name__ == "__main__":
    try:
        main()
    except (EOFError, KeyboardInterrupt):
        print(f"\nEntrada encerrada. Programa finalizado.")