import React from 'react';
import ButttonsProd from "./ButtonsProd";

function Prod(props) {
    const produto = props.produto;
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
                (<ul>{produto.itens_extras.map((item,i)=>(<li key={`it_${i}`}>item</li>))}</ul>)
                :'Sem Itens'}
            </td>
            <td>
                <ButttonsProd id={produto.id_prod}/>
            </td>
        </tr>);
}

export default Prod