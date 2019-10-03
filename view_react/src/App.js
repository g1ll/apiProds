import React, {useState,useEffect} from 'react';
import TableProds from './TableProds';
import logo from './logo192.png';
import './App.css';

function App() {
  const apiUrl='http://localhost/2019/tsi/dsw/apiProds';
  const [busca,setBusca] = useState('asdf')
  const [data,setData] = useState(false)

  useEffect(()=>{
    async function loadData(){
      const login = await loga()
      console.log(login);
      if(login) {
        const dataFetch = await fetchData();
        setData(dataFetch)
      }
      console.log(vloga())
    }
    if(!data)
      loadData();
    setBusca('asd')
    console.log(data)
  },[data]);

  return (
      <><div className='col1'>
        <h1>REACT</h1>
      {/*  TODO: Component Form*/}
      </div>
        <div className='col2'>
          <h3>Produtos Cadastrados</h3>
          {(data)?(<TableProds produtos={data}/>):(<h4>Sem Produtos</h4>)}
        </div>
        <img src={logo} width={20}
             style={{position:'fixed',top:'0px',right:'0px'}}/>
      </>
  );

  async function fetchData() {
    try {
      const resp = await fetch(`${apiUrl}/produto/nome/${busca}`);
      const dados =  await (response => response.json())(resp)
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
      const resp= await fetch(`${apiUrl}/login`,{
        method: 'POST',
        body: dataform,
        //headers: { 'Content-Type': 'application/json' },
        //headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        mode: 'cors',
      });
      const data  = await (response =>response.json())(resp)
      return data.login;
    }catch(error){
      console.error(`Erro:${error}`);
      return false;
    }
  }

  async function vloga() {

    try{
      const resp= await fetch(`${apiUrl}/login`);
      const data  = await (response =>response.json())(resp)
      return data.login;
    }catch(error){
      console.error(`Erro:${error}`);
      return false;
    }
  }
}

export default App;
