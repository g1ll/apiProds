if(typeof window === "undefined"){fetch = require('node-fetch');}
//const api = 'http://localhost:9090'
const api = 'http://localhost/2019/tsi/dsw/apiProds';

let listProds = [];
let prodIdedit = 0;
const cadastro = document.cadastro;

cadastro.onsubmit = processaCadastro;

getProdutosAPIasync('5/5');

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
        mode: 'no-cors'
    })
        .then(response =>response.json())
        .then(data =>{
            console.log(data);
            getProdutosAPIasync(`${data.produto.id_prod-9}/10/1`)
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
            getProdutosAPIasync(`-10/10/1`)
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
                alert(data.msg)
            }else{
                console.log(data.msg)
                alert("INFELIZMENTE NÃO FOI POSSÍVEL DELETAR O PRODUTO")
            }
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
        mostrarDadosConsole(data);
    }catch (e) {
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
    }).then(data=>mostrarDadosConsole(data))
        .catch(error => {
            console.log(`${error}`);
            return false
        });
}

function mostrarDadosConsole(data) {
    listProds = data;
    console.log({listProds});
    console.table(listProds);
    mostarDados(listProds);
}

function mostarDados(data){
    let rows ='';
    data.forEach(obj => {
        rows += '<tr>';
        Object.entries(obj).map(([key, prod]) => {
            if(key==='importado')
                prod=(Number(prod))?'Importado':'Nacional';
                if(Array.isArray(prod)){
                    rows += `<td>${(prod.length)?
                        `<ul><li>${prod.join('</li><li>')}</li><ul>`
                        :'---'}</td>`
                }else{rows += `<td>${prod}</td>`}

        });
        rows += `<td><button title='Remover este item.' 
                            onclick='removeProd(${obj.id_prod})'>
                        &#128465</button>
                        <button title='Editar este item.' 
                            onclick='editProd(${obj.id_prod})'>
                        &#10000;</button>
                    </td>`;
        rows += '</tr>';
    });
    document.querySelector('tbody').innerHTML = rows
}

function processaCadastro(e){
    e.preventDefault();
    const submit = document.querySelector('input[type="submit"]');
    const titulo = document.querySelectorAll('h3')[0];

    const selectdesco = Array.from(
        this.desco.selectedOptions
    ).map(option => option.value);

    const listItens = [];
    Array.from(this.itens).forEach(item => {
        if (item.checked) listItens.push(item.value)
    });

    const produto = {
        nome: this.nome.value,
        descricao: this.desc.value,
        qtd_estoque: this.qtd.value,
        preco: this.preco.value,
        importado: (this.ori.value==='Importado')?1:0,
        desco: (selectdesco.length) ? selectdesco : 'Sem Descontos',
        itens: (listItens.length) ? listItens : 'Sem Itens'
    };
    if (!prodIdedit) { //Cadastrar
        addProdutoAPI(produto)
    } else { //Salvar
        produto.id_prod = prodIdedit;
        editProdutoAPI(produto);
        prodIdedit = 0;
        this.setAttribute('style', '');
        titulo.setAttribute('style', '')
    }
    titulo.innerHTML = 'Cadastrar Produto';
    submit.value = 'Cadastrar';
    this.reset()
}

function removeProd(idpro) {
    if (confirm('Você excluirá este item definitivamente!')) {
       delProdutoAPI(idpro);
       getProdutosAPI('0/10')
    }
}

function editProd(idpro) {
    const prod = listProds.find((prod) => Number(prod.id_prod) === idpro);
    console.log(prod);
    console.log(`${prod.id_prod}`);
    if (prod) {
        const cadastro = document.cadastro;
        cadastro.nome.value = prod.nome;
        cadastro.desc.value = prod.descricao;
        cadastro.qtd.value = prod.qtd_estoque;
        cadastro.preco.value = prod.preco;
        if (prod.importado)
            cadastro.ori[(prod.importado === "0") ? 0 : 1].checked = true;
        const titulo = document.querySelectorAll('h3')[0];
        titulo.innerHTML = 'Editar Produto';
        titulo.setAttribute('style', 'color:red');
        cadastro.submit.value = 'Salvar';
        prodIdedit = prod.id_prod;
        cadastro.nome.focus();
        cadastro.setAttribute('style', 'border:solid 2px red;border-radius:10px')
    }
}