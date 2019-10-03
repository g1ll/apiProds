import React, {useState,useEffect} from 'react';
import Prod from './Prod'

function TableProds(props){
    console.log(props)
    const listProds = props.produtos;
    return(
        <table>
            <thead>
            <tr>
                <th><a href="#" >{"\u25b2"} ID</a></th>
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