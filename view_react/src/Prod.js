import React, {useState,useEffect} from 'react';

function Prod(props) {
    const produto = props.produto;
    console.log({produto})
    return (
        <tr>
            <td>{produto.id_prod}</td>
            <td>{produto.nome}</td>
            <td>{produto.descricao}</td>
            <td>{produto.qtd_estoque}</td>
            <td>{produto.preco}</td>
            <td>{produto.importado?'Importado':'Nacional'}</td>
            <td>{produto.descontos.length>0 ?
                (<ul>{produto.descontos.map((desc,i)=><li key={`d_${i}`}>{desc}</li>)}</ul>)
                :('Sem desconto')}
            </td>
            <td>{produto.itens_extras.length>0 ?
                (<ul>{produto.itens_extras.map(item=>(<li>item</li>))}</ul>)
                :'Sem Itens'}
            </td>
            <td>
            {/*    TODO: Componentes para os botões*/}
            </td>
        </tr>);
}

export default Prod;