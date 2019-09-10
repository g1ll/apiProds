//http://g1ll.000webhostapp.com/ajaxphp/consulta.php
//const fetch = require('node-fetch');
//const api = 'http://localhost/2019/tsi/dsw/apiProds'
const api = 'http://localhost:9090'
document.cadastro.onsubmit = function(e) {
    e.preventDefault();

    const novoObj = {
        name: this.nome.value,
        altura: this.alt.value,
        peso: this.peso.value,
        imc: Number((this.peso.value / this.alt.value ** 2).toFixed(2))
    }

    const dataform = new FormData();
    Object.entries(novoObj).map(([key, value]) => { dataform.append(key, value) });

    fetch(api+'/produto', {
        method: 'POST',
        body: dataform,
        mode: 'no-cors'
    }).then(response => {
        if (response.status == 200) {
            return response.json();
        } else {
            throw new Error(`Erro ao completar a requisiçao ${response.statusText}`)
        }
    }).then(texto => {
        console.log(texto)
        if(texto.confirm===true)
            alert("Dados Cadastrados!!");
        else
            throw new Error(`Erro ao cadastrar dados!${texto.msg}`)
    }).catch(error => {
        console.log(`${error.message}`)
    });
}