import React, {useState,useEffect} from 'react';
import Axios from 'axios';
import TableProds from './TableProds';
import logo from './logo192.png';
import './App.css';
import FormAddProd from "./FormAddProd";

function App() {
  //   const apiUrl='http://g1ll.000webhostapp.com/apiProds/produto';
  //   const apiUrl='http://g1ll.epizy.com/apiProds/produto';
  const apiUrl='http://localhost/2019/tsi/dsw/apiProds/';
  const axios = Axios.create({baseURL:apiUrl})
  const [api_params,setApiParams] = useState(['1','10'])

  // const [busca,setBusca] = useState('asdf')

  const [data,setData] = useState([])

  useEffect(()=> {
    loadData();
  },[]);

  return (
      <><div className='col1'>
      <FormAddProd />
      </div>
        <div className='col2'>
          <h3>Produtos Cadastrados</h3>
          {(data.length>0)?
              (<TableProds
                    produtos={data}
                    rmProd={removeProduto}
                    updProd={editProduto}
                    revList={reverseData}/>):
              (<h4>Carregando Produtos...</h4>)}
        </div>
        <img src={logo} width={20}
             style={{position:'fixed',top:'0px',right:'0px'}}
        />
      </>
  );

  async function fetchData() {
    try {
      const resp = await axios.get(`produto/${[api_params.join('/')]}`);
      const dados = resp.data;
      return dados;
    }catch(e){
      console.log(e)
      return false
    }
  }

  async function loga() {
    const dataform = new FormData();
    dataform.append('user','g1ll')
    dataform.append('key','g1ll@dsw');
    try{
      const resp= await axios.post(`login`,dataform,
          { headers: {
        'Content-Type': 'application/x-www-form-urlencoded','Accept': 'application/json'
      }});
      const data  = resp.data;
      return data.login;
    }catch(error){
      console.error(`Erro:${error}`);
      return false;
    }
  }

  async function loadData() {
    const login = await loga()
    console.log(login);
    if (login) {
      const dataFetch = await fetchData();
      console.log(dataFetch);
      setData([...dataFetch])
    }
  }

  async function addProduto() {
    alert('add produto');
  }

  async function removeProduto(id) {
    const login = await loga()
    console.log(login);
    if (login) {
      let prod = data.find(p=>p.id_prod===id)
      if(confirmaExcluir(prod)){
        try {
          const resp = await axios.delete('produto', {data:{id_prod: Number(id)}});
          (data => {
            if (data.sucesso)
              console.log(`Registro ${data.id} excluido.!`)
            else console.error(`Não foi possível excluir o registro de ID:${id}`)
            console.table(data);
          })(resp.data);
        } catch (error) {
          console.error("ERRO AO CONECTAR COM A API: " + error)
        }
      }
      loadData();
    }
  }

  function confirmaExcluir(prod){
    return window.confirm(`Você excluirá este item definitivamente!
        \n\t\########### PRODUTO #########\n\t\tID:${Number(prod.id_prod)}
        \tNome: ${prod.nome}\n\t\tDescrição: 
        \t\t${(prod.descricao.length>20)?prod.descricao.substr(0,20)+'...' :prod.descricao}
        ----------------------------------------------------------------
        \n\t\tTEM CERTEZA QUE DESEJA EXCLUIR ?\n`);
  }

  async function editProduto(id) {
    alert(`editar prod id: ${id}`)
  }
  
  function reverseData() {
    //SEM OPERADOR SPREAD
    // console.log({"listProdFirst":listProds[0].id_prod});
    // data.reverse();
    // let rev = [];
    // data.map(i=>rev.push(i));
    // console.log({"revFirst":rev[0].id_prod});
    // setData(rev);
    //COM OPERADOR SPREAD
    setData([...data.reverse()]);
  }
}

export default App;
