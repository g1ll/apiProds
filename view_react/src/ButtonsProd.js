import React from 'react';
import './css/buttonsProd.css';

const ButttonsProd=props=> {
    return(
        <>
        <button title={`Remover este item ${props.id}.`}
                onClick={()=>{
                    // console.log(props);
                    props.rmProd(props.id)
                    }
                }>
            &#x1F5D1;</button>
            <button title={`Editar este item ${props.id}.`}
                    onClick={()=>{
                        props.updProd(props.id)
                    }}>
                {"\u270e"}</button>
        </>
    )
}

export default ButttonsProd