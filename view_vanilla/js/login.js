document.form_login.onsubmit = logar;
async function logar(e) {
    e.preventDefault();
    const user  = form_login.user.value;
    const key = form_login.key.value;
    if(await loginAPI(user,key)){
        window.location='./index.html';
    }else{
        alert("Erro de autenticação!!")
    }
}