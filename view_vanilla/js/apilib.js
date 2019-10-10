const apifolder = 'apiProds';
const url_api = getBaseUrl(apifolder);

function getBaseUrl(folder){
    let urlarray = (window.location.pathname).split('/');
    urlarray.splice(urlarray.findIndex((v)=>v===folder)+1,urlarray.length)
    return urlarray.join('/');
}

async function addProdutoAPI(produto) {
    console.log({produto})
    const dataform = new FormData();

    Object.entries(produto).map(([key, value]) => {
        console.log(`${key}:${value}`);
        if(Array.isArray(value))
            value.forEach(data=>dataform.append(key+'[]', data));
        else dataform.append(key, value)
    });
    // dataform.append('produto',JSON.stringify(produto)),
    try{
        const resp = await fetch(url_api + '/produto/', {
            method: 'POST',
            body: dataform,
            // headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            // headers: { 'Content-Type': 'multipart/form-data' },
            mode: 'cors'
        });
        const data = await (response => response.json())(resp);
        if (data.confirm) {
            return true;
        } else {
            alert(data.msg);
            console.error(data.msg);
            return false;
        }
    }catch(e){
        console.error(`Erro:${e}`);
    }
}

async function editProdutoAPI(produto) {
    try {
        const resp = await fetch(url_api+'/produto/', {
            method: 'PUT',
            body: JSON.stringify(produto),
            // body: dataform,
            headers: { 'Content-Type': 'application/json' },
            //headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            mode: 'cors'
        });
        const data = await (response =>response.json())(resp);
        console.info(data);
            if(data.confirm) {
                return true;
            }else {
                alert(data.msg);
                console.error(data.msg);
                return false
            }
    }catch(e){
        console.error(`Erro:${e}`);
    }
}

async function delProdutoAPI(id){
    try{
        const resp = await fetch(url_api+'/produto/', {
            method: 'DELETE',
            body: JSON.stringify({id_prod:id}),
            // body: dataform,
            headers: { 'Content-Type': 'application/json' },
            //headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            mode: 'cors'
        });
        const data = await (response =>response.json())(resp);
        if(data.confirm){
            console.log(data.msg)
            return true
        }else{
            console.log(data.msg)
            return false;
        }
    }catch(e){
        console.error(`Erro:${e}`);
    }
}

async function getProdutosAPI(req) {
    const requisicao = '/produto/'+req;
    console.info("%cFUNÇÃO COM ASYNC/AWAIT SINTAXE","color:green");
    try{
        const resp = await fetch(url_api+requisicao, {
            method: 'GET',
            headers: { 'Content-Type': 'application/json' },
            mode: 'cors'
        });
        const data = await (response=>{
            console.log(response.headers)
            if(response.status===200 && response.ok ){
                //mostrarDadosConsole(response.json()) //NÃO FUNCIONA
                return response.json()
            }else{
                throw new Error("Erro ao receber dados!"+response.statusText)
            }
        })(resp);
        if(validaApi(data)) {
            // listProds = data;
            // mostrarDadosConsole(listProds);
            // mostrarDados(data)
            return data;
        }else{
            console.log(data);
            throw new Error("Erro ao receber dados!"+data.info);
        }
    }catch (e) {
        //alert(e);
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
        const resp = await fetch(url_api + '/login', {
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
        const resp = await fetch(url_api + '/login/logout', {
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

async function loginAPI(user,key) {
    const dataform = new FormData();
    dataform.append('user',user)
    dataform.append('key',key);
    try{
        const resp= await fetch(url_api+'/login', {
            method: 'POST',
            body: dataform,
            //headers: { 'Content-Type': 'application/json' },
            //headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            mode: 'cors'
        });
        const data  = await (response =>response.json())(resp)
        return data.login;
    }catch(error){
        console.error(`Erro:${error}`);
        return false;
    }
}