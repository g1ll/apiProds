function addProdutoAPI(produto) {
    const dataform = new FormData();

    Object.entries(produto).map(([key, value]) => {
        console.log(`${key}:${value}`);
        dataform.append(key, value)
    });

    fetch(api+'/produto/', {
        method: 'POST',
        body: dataform,
        //headers: { 'Content-Type': 'application/json' },
        //headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        mode: 'cors'
    })
        .then(response =>response.json())
        .then(data =>{
            console.log(data);
            idInit = data.produto.id_prod;
            getProdutosAPIasync(`${-1}/${qtd_prods}/${ordem}}`)
                .catch(error =>console.error(`Erro:${error}`))});
}

function editProdutoAPI(produto) {

    fetch(api+'/produto/', {
        method: 'PUT',
        body: JSON.stringify(produto),
        // body: dataform,
        headers: { 'Content-Type': 'application/json' },
        //headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        mode: 'cors'
    })
        .then(response =>response.json())
        .then(data=>{
            console.info(data);
            getProdutosAPIasync(`${idInit}/${qtd_prods}/${ordem}`)
        })
        .catch(error=>console.error(`Erro:${error}`));
}

function delProdutoAPI(id){

    fetch(api+'/produto/', {
        method: 'DELETE',
        body: JSON.stringify({id_prod:id}),
        // body: dataform,
        headers: { 'Content-Type': 'application/json' },
        //headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        mode: 'cors'
    })
        .then(response =>response.json())
        .then(data => {
            console.log(data)
            if(data.confirm){
                console.info(data.msg)
            }else{
                console.log(data.msg)
                alert("INFELIZMENTE NÃO FOI POSSÍVEL DELETAR O PRODUTO")
            }
            getProdutosAPIasync(`${idInit}/${qtd_prods}/${ordem}`)
        })
        .catch(error => console.error(`Erro:${error}`))
}

async function getProdutosAPIasync(req) {
    const requisicao = '/produto/'+req;
    console.info("%cFUNÇÃO COM ASYNC/AWAIT SINTAXE","color:green");
    try{
        const resp = await fetch(api+requisicao, {
            method: 'GET',
            headers: { 'Content-Type': 'application/json' },
            mode: 'cors'
        });
        const data = await (response=>{
            if(response.status===200 && response.ok ){
                //mostrarDadosConsole(response.json()) //NÃO FUNCIONA
                return response.json()
            }else{
                throw new Error("Erro ao receber dados!"+response.statusText)
            }
        })(resp);
        listProds=data;
        mostrarDadosConsole(listProds);
    }catch (e) {
        alert(e);
        console.error(`${e}`);
        return false
    }
}

function getProdutosAPI(req) {
    console.info("%cFUNÇÃO COM PROMISE SINTAXE","color:blue");
    // const requisicao = '/produto/0/5'
    // const requisicao = '/produto/10/10'
    // const requisicao = '/produto/90/5'
    // const requisicao = '/produto/85'
    // const requisicao = '/produto'
    const requisicao = '/produto/'+req;
    fetch(api+requisicao, {
        method: 'GET',
        //body: JSON.stringify(novoObj),
        //body: dataform,
        headers: { 'Content-Type': 'application/json' },
        //headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        mode: 'cors'
    }).then(response => {
        //console.log(response);
        if(response.status===200 && response.ok ){
            return response.json()
        }else{
            throw new Error("Erro ao receber dados!"+response.statusText)
        }
    }).then(data=>{
        listProds=data
        mostrarDadosConsole(listProds)})
        .catch(error => {
            console.log(`${error}`);
            return false
        });
}