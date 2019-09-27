
const api = 'http://172.16.249.5/2019/tsi/dsw/apiProds';

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
            getProdutosAPIasync(`${idInit}/${qtd_prods}/${ordem}}`)
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
            if(data.confirm) {
                getProdutosAPIasync(`${idInit}/${qtd_prods}/${ordem}`)
            }else {
                alert(data.msg);
                console.error(data.msg);
            }
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
        if(validaApi(data)) {
            listProds = data;
            mostrarDadosConsole(listProds);
        }else{
            console.log(data);
            throw new Error("Erro ao receber dados!"+response.statusText+" "+data.info);
        }
    }catch (e) {
        alert(e);
        console.error(`${e}`);
        return false
    }
}

function validaApi(data) {
    if(Array.isArray(data)) {
        return true;
    }else{
        if(typeof data.confirm ==='undefined')
            return true
        else
            return data.confirm;
    }
}

async function isLoggedAPI() {
    try {
        const resp = await fetch(api + '/login', {
            method: 'GET',
            //headers: { 'Content-Type': 'application/json' },
            //headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            mode: 'cors'
        });
        const data = await (response => response.json())(resp);
        return (data => {

            console.log(data);
           // alert(data.login);
            return data.login;
        })(data);
    }catch{(error =>console.error(`Erro:${error}`))}
}

async function logoutAPI() {
    try {
        const resp = await fetch(api + '/login/logout', {
            method: 'GET',
            //headers: { 'Content-Type': 'application/json' },
            //headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            mode: 'cors'
        });
        const data = await (response => response.json())(resp);
        return (data => {

            console.log(data);
            // alert(data.login);
            return data.login;
        })(data);
    }catch{(error =>console.error(`Erro:${error}`))}

}