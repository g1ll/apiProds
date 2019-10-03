let close_button = document.querySelector('.close');

close_button.onclick = function(){
    closeForm(document.querySelector('form'),close_button);
}

window.onresize=()=>{
    if(window.innerWidth>810){
        displayForm(document.querySelector('form'),close_button)
    }else{
        if(document.querySelector('form').className!=='show')
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