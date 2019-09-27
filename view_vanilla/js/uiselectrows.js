
let seletor = document.querySelector('#selectRows')

seletor.onchange=function() {
    qtd_prods =this.value
    console.log({qtd_prods})
    console.log({listProdsLength:listProds.length})
    if (qtd_prods <= listProds.length) {
        listProds = listProds.filter((prod, i) => i < qtd_prods)
        console.log(listProds)
        console.log(listProds)
        mostrarDados(listProds)
    } else {
        console.log(`pedir mais: ${idInit}/${qtd_prods}/${ordem}`)
        getProdutosAPIasync(`${idInit}/${qtd_prods}/${ordem}`)
    }
};

