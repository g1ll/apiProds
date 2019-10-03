import React, {useState,useEffect} from 'react';
import TableProds from './TableProds';
import logo from './logo192.png';
import './App.css';

function App() {
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
      </div>
        <div className='col2'>
          <TableProds produtos={data}/>
        </div>
        <img src={logo} width={20}
             style={{position:'fixed',top:'0px',right:'0px'}}/>
      </>
  );

  async function fetchData() {
    try {
      const resp = await fetch(`http://localhost/2019/tsi/dsw/apiProds/produto/nome/${busca}`);
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
      const resp= await fetch(`http://localhost/2019/tsi/dsw/apiProds/login`,{
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
      const resp= await fetch(`http://localhost/2019/tsi/dsw/apiProds/login`);
      const data  = await (response =>response.json())(resp)
      return data.login;
    }catch(error){
      console.error(`Erro:${error}`);
      return false;
    }
  }
}

export default App;
