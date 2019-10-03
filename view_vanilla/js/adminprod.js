let listProds = []
let prodIdedit = 0
const cadastro = document.cadastro
let ordem = 0
let qtd_prods = 5
let idInit = 1

document.querySelector(".exit").onclick=exit;
cadastro.onsubmit = processaCadastro

verificaLogin(async function(){
    document.body.className = "visible";
    listProds = await getProdutosAPIasync(`${idInit}/${qtd_prods}/${ordem}`);
    mostrarDadosConsole(listProds);
    mostrarDados(listProds)
});

async function processaCadastro(e){
    e.preventDefault();
    await verificaLogin();
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
        ordem = 1;
        idInit = -1;
        if(await addProdutoAPI(produto)){
            listProds = await getProdutosAPIasync(`${idInit}/${qtd_prods}/${ordem}`);
        }else{
            console.error("Erro ao cadastrar Produto");
        }
    }else { //Salvar
        produto.id_prod = prodIdedit;
        if(await editProdutoAPI(produto)){
            listProds = await getProdutosAPIasync(`${produto.id_prod}/${qtd_prods}/${ordem}`);
        }else{
            console.error("Erro ao editar Produto");
        }
        prodIdedit = 0;
        this.setAttribute('style', '');
        titulo.setAttribute('style', '')
    }
    titulo.innerHTML = 'Cadastrar Produto';
    submit.value = 'Cadastrar';
    mostrarDadosConsole(listProds);
    mostrarDados(listProds)
    this.reset()
    if(innerWidth<720)
        closeForm(cadastro,button);
}

function removeProd(idpro) {
    verificaLogin(async function(){
        if (confirm('Você excluirá este item definitivamente!')) {
            if(await delProdutoAPI(idpro)){
                listProds = await getProdutosAPIasync(`${idInit}/${qtd_prods}/${ordem}`);
                mostrarDadosConsole(listProds);
                mostrarDados(listProds)
            }else{
                alert("INFELIZMENTE NÃO FOI POSSÍVEL DELETAR O PRODUTO")
            }
        }})
}

function editProd(idpro) {
    verificaLogin(()=> {
        console.clear()
        const prod = listProds.find((prod) => Number(prod.id_prod) === idpro);
        console.log(prod);
        console.log(`${prod.id_prod}`);
        if (prod) {
            cadastro.nome.value = prod.nome;
            cadastro.desc.value = prod.descricao;
            cadastro.qtd.value = prod.qtd_estoque;
            cadastro.preco.value = prod.preco;
            if (prod.importado)
                cadastro.ori[(prod.importado === "0") ? 0 : 1].checked = true;
            const titulo = document.querySelectorAll('h3')[0];
            titulo.innerHTML = 'Editar Produto ID: ' + prod.id_prod;
            titulo.setAttribute('style', 'color:red');
            cadastro.submit.value = 'Salvar';
            prodIdedit = prod.id_prod;
            cadastro.nome.focus();
            window.scrollTo(0,0);
            cadastro.setAttribute('style', 'border:solid 2px red;border-radius:10px')
            displayForm(cadastro, button)
        } else {
            alert("erro")
        }
    });
}

function mostrarDadosConsole(data) {
    console.log({data})
    console.table(data)
}

function  mostrarDados(data){
    if(idInit>0){
        if(ordem) {
            idInit = listProds[listProds.length-1].id_prod
        }else {
            idInit = listProds[0].id_prod
        }
    }
    let rows ='';
    data.forEach(obj => {
        rows += '<tr>'
        Object.entries(obj).map(([key, prod]) => {
            if(key==='importado')
                prod=(Number(prod))?'Importado':'Nacional'
                if(Array.isArray(prod)){
                    rows += `<td>${(prod.length)?
                        `<ul><li>${prod.join('</li><li>')}</li><ul>`
                        :'---'}</td>`
                }else{rows += '<td>'+prod+'</td>'}
        })
        rows += `<td><button title='Remover este item.' 
                            onclick='removeProd(${obj.id_prod})'>
                        &#128465</button>
                        <button title='Editar este item.' 
                            onclick='editProd(${obj.id_prod})'>
                        &#x270e;</button>
                    </td>`
        rows += '</tr>'
    })
    document.querySelector('tbody').innerHTML = rows
}

function order(el) {
   verificaLogin(()=>{
    if(ordem==0)el.innerHTML = '&#x25bc ID'
    else el.innerHTML = '&#x25b2 ID';
    ordem = (ordem==0)?1:0;
    console.log(ordem)
    mostrarDados(listProds.reverse())
});}

function abilitaSubmit(el) {
    console.log(el.value);
    const form = document.cadastro;
    form.desc.value = "Digite a descricao";
    const sub = form.submit;
    console.log(sub);
    if(el.value!==''){
        sub.removeAttribute('disabled');
    }else{sub.setAttribute('disabled','');}
}

async function verificaLogin(callback=null) {
    const logged = await isLoggedAPI();
    if (!logged) {
        alert("Erro de autenticação!!")
        window.location = './login.html'
    }else{
        if(callback)callback();
    }
}

async function exit() {
    await logoutAPI();
    window.location = './login.html'
}