let button = document.querySelector('.close');
button.onclick=()=>{
    closeForm(document.querySelector('form'),button);
}

window.onresize=()=>{
    if(document.querySelector('form').style.display==='none')
    if(window.innerWidth>810){
        displayForm(document.querySelector('form'),button)
    }else{
        closeForm(document.querySelector('form'),button)
    }
}

function closeForm(form,botao){
    console.log(form)
    console.log(form.style.display)
    if(form.style.display==='block'||!form.style.display) {
        form.style.display = 'none';
        //botao.innerHTML='&#8964;'
        botao.innerHTML='&#9776'
    }
    botao.onclick = ()=>{displayForm(form,botao)};
}

function displayForm(form,botao) {
    if(form.style.display==='none') {
        form.style.display = 'block';
        botao.innerHTML=' &#xd7'
    }
    botao.onclick = ()=>{closeForm(form,botao)};
}