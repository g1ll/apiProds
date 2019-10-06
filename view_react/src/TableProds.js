import React from 'react';
import './css/tableProd.css'
import Prod from './Prod'

function TableProds(props){
    const listProds = props.produtos;

    return(
        <table>
            <thead>
            <tr>
                <th><button onClick={()=>{props.revList()}}>
                    {listProds?(Number(listProds[1].id_prod)>Number(listProds[0].id_prod)) ? ("\u25b2"):("\u25bc"):("\u25b2")}
                    &nbsp;&nbsp;ID</button></th>
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
                prod=>(<Prod key={prod.id_prod} produto={prod}  rmProd={props.rmProd} updProd={props.updProd}/>)
            ):<tr><td>Sem Produtos</td></tr>}</tbody>
        </table>
    )
}

export default TableProds;