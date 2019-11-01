import React, {useState} from 'react'
import './css/form.css'

function FormAddProd(props) {

    const [mostrar,setMostrar] = useState(window.innerWidth>810)
    const [disabled,setDisabled] = useState(true)
    const [prod,setProd] = useState({
        nome: '',
        descricao: '',
        qtd_estoque: 0,
        preco: 0.0,
        importado: 0,
        desco: 'Sem Descontos',
        itens: 'Sem Itens'
    })

    window.onresize=()=>{
        if(window.innerWidth>810){
            setMostrar(true)
        }else{
            if(disabled)setMostrar(false)
        }
    }

    function submitForm(event){
        event.preventDefault();
        alert("Adicionar Produto");
        props.addProd(prod);
    }

    const handleChangeNome=(event)=>{
        setDisabled(false)
        setProd({...prod, nome:event.target.value})
    }

    const handleChangeDescricao=(event)=>{
        setProd({...prod, descricao:event.target.value})
    }
    const handleChangeEstoque =(event)=>{
        setProd({...prod, qtd_estoque:event.target.value})
    }
    const handleChangePreco=(event)=>{
        setProd({...prod, preco:event.target.value})
    }

    return (<>
            <h3>Cadastro de Produtos</h3>
            <button className="close"
                    onClick={
                        ()=>{
                            setMostrar(mostrar?false:true)
                            setDisabled(true)
                        }
                    }>
                {mostrar?"\u2715":"\u2630"}</button>

        {mostrar? (
            <form name="cadastro" onSubmit={submitForm}>
                <br/>Nome:<input type="text" name="nome" required
                                 onChange={handleChangeNome}
                                 value={prod.nome}/>
                <br/>Descrição:<br/>
                <textarea rows="5" cols="30" name="desc" draggable="false" onChange={handleChangeDescricao}/>
                <br/>Quantidade em Estoque:<input type="number" name="qtd" onChange={handleChangeEstoque}/>
                <br/>Preço:<input type="number" name="preco" step="0.01" onChange={handleChangePreco}/>
                <br/>Origem
                <ul>
                    <li><input type="radio" name="ori" value="Nacional"/>Nacional</li>
                    <li><input type="radio" name="ori" value="Importado"/>Importado</li>
                </ul>
                <br />Descontos:
                <br /><select multiple size="7" name="desco">
                    <option value="1">10% a vista no Débito</option>
                    <option value="2">20% a vista no Boleto</option>
                    <option value="3">Brinde para pagamento a vista</option>
                    <option value="4">Até 3x sem juros no crédito</option>
                    {/*<option>Até 4x sem juros no crédito</option>*/}
                    {/*<option>Até 5x sem juros no crédito</option>*/}
                    {/*<option>Até 6x sem juros no crédito</option>*/}
                </select>
                <br />Itens Adicionais:
                <ul>
                    <li><input type="checkbox" name="itens" value="Grantia Extendida"/>Garantia Extendida.</li>
                    <li><input type="checkbox" name="itens" value="Entrega Rápida"/>Entrega Rápida.</li>
                    <li><input type="checkbox" name="itens" value="Retirada em lojas"/>Retirada em lojas.</li>
                </ul>
                <br /> <input type="submit" name='submit' disabled={disabled} value="Cadastrar" />
            </form>

        ):(null)}
    </>)
}

export default FormAddProd;
