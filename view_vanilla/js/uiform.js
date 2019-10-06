const form = document.cadastro;
const close_button = document.querySelector('.close');

cadastro.nome.onchange = function (){
    console.log(this.value);
    form.desc.value = "Digite a descricao";
    const sub = form.submit;
    console.log(sub);
    if (this.value !== '') {
        sub.removeAttribute('disabled');
    } else {
        sub.setAttribute('disabled', '');
    }
};

close_button.onclick = function(){
    closeForm(document.querySelector('form'),close_button);
}

window.onresize=()=>{
    if(document.querySelector('form').style.display==='none')
    if(window.innerWidth>810){
        displayForm(document.querySelector('form'),close_button)
    }else{
        closeForm(document.querySelector('form'),close_button)
    }
}

if(window.innerWidth<810)
    closeForm(document.querySelector('form'),close_button)

function closeForm(form,botao){
    console.log({form,botao})
    form.reset();
    form.setAttribute('style', '');
    document.querySelector('h3').setAttribute('style', '')
    document.querySelector('h3').innerHTML = 'Cadastrar Produto';
    form.submit.value = 'Cadastrar';
    form.className = 'hide';
    //botao.innerHTML='&#8964;'
    botao.innerHTML='&#9776;'
    botao.onclick = ()=>{displayForm(form,botao)};
}

function displayForm(form,botao) {
    form.className = 'show';
    botao.innerHTML=' &#xd7;'
    botao.onclick = ()=>{closeForm(form,botao)};
}
