import React from 'react'

function FormAddProd(props) {
    return (
        <form name="cadastro">
            <br/>Nome:<input type="text" name="nome" required />
            <br/>Descrição:<br/><textarea rows="5" cols="30" name="desc" draggable="false"></textarea>
            <br/>Quantidade em Estoque:<input type="number" name="qtd"/>
            <br/>Preço:<input type="number" name="preco" step="0.01"/>
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
            <br /> <input type="submit" name='submit' disabled value="Cadastrar" />
        </form>
        )
}

export default FormAddProd;
