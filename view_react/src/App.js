import React, {useState,useEffect} from 'react';
import Axios from 'axios';
import TableProds from './TableProds';
import logo from './logo192.png';
import './App.css';

function App() {
  // const apiUrl='http://localhost/2019/tsi/dsw/apiProds';
    const apiUrl='http://g1ll.000webhostapp.com/apiProds';
    // const apiUrl='http://g1ll.epizy.com/apiProds';

    const [busca,setBusca] = useState('asdf')
  const [data,setData] = useState([])

  useEffect(()=> {
    async function loadData() {
      const login = await loga()
      console.log(login);
      if (login) {
        const dataFetch = await fetchData();
        setData(dataFetch)
      }
      console.log(vloga())
    }
    loadData();
    console.log(data)
  },[]);

  return (
      <><div className='col1'>
        <h1>REACT</h1>
      {/*  TODO: Component Form*/}
      </div>
        <div className='col2'>
          <h3>Produtos Cadastrados</h3>
          {(data.length>0)?(<TableProds produtos={data}/>):
              (<h4>Carregando Produtos...</h4>)}
        </div>
        <img src={logo} width={20}
             style={{position:'fixed',top:'0px',right:'0px'}}
        />
      </>
  );

  async function fetchData() {
    try {
      const resp = await Axios.get(`${apiUrl}/produto/nome/${busca}`);
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
      const resp= await Axios.post(`${apiUrl}/login`,dataform,
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

  async function vloga() {
    try{
      const resp= await Axios.get(`${apiUrl}/login`);
      const data  = resp.data;
      return data.login;
    }catch(error){
      console.error(`Erro:${error}`);
      return false;
    }
  }
}

export default App;
