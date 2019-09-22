
let seletor = document.querySelector('#selectRows')

seletor.onchange=function() {
    qtd_prods =this.value;
    console.log(listProds.length);
    if (qtd_prods <= listProds.length) {
        let templistProds = listProds.filter((prod, i) => i < qtd_prods);
        console.log(templistProds);
        console.log(listProds);
        mostrarDados(templistProds);
    } else {
        if(ordem)
            getProdutosAPIasync(`${-qtd_prods}/${qtd_prods}/${ordem}`)
        else
            getProdutosAPIasync(`${idInit}/${qtd_prods}/${ordem}`)
    }
};

