import React from 'react';
import './css/buttonsProd.css';

const ButttonsProd= props=> {
    const prod = props.produto;
    return(
        <>
        <button title={`Remover este item ${prod.id_prod}.`}
                onClick={()=>{alert(`remover prod id: ${prod.id_prod}`)}}>
            &#x1F5D1;</button>
            <button title={`Editar este item ${prod.id_prod}.`}
                    onClick={()=>{alert(`editar prod id: ${prod.id_prod}`)}}>
                {"\u270e"}</button>
        </>
    )
}

export default ButttonsProd