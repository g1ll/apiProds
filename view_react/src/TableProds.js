import React, {useState,useEffect} from 'react';
import './css/tableProd.css'
import Prod from './Prod'

function TableProds(props){
    const initialList = props.produtos;
    const [listProds,setLitProds] = useState(initialList);
    useEffect(()=> {
        setLitProds(props.produtos)
    },[props]);
    return(
        <table>
            <thead>
            <tr>
                <th><button onClick={()=>setLitProds([...listProds.reverse()])}>
                    {(Number(listProds[1].id_prod)>Number(listProds[0].id_prod)) ? ("\u25b2"):("\u25bc")}
                    ID</button></th>
                <th>Nome</th>
                <th>Descrição</th>
                <th>Qtd</th>
                <th>Preço</th>
                <th>Origem</th>
                <th>Descontos</th>
                <th>Itens</th>
                <th>Ações</th>
            </tr>
            </thead>
            <tbody>{listProds? listProds.map(
                prod=>(<Prod key={prod.id_prod} produto={prod}/>)
            ):<tr><td>Sem Produtos</td></tr>}</tbody>
        </table>
    )
}

export default TableProds;