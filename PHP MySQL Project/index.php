<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Calculadora</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <form>
            <input type="text" id="valor" name="valor">
        </form>
        

        <div class="botoes">
            <div class="botaoabrepar">
                <button type="button" onclick="Inserirabrepar()">AbrePar</button>
            </div>
            <div class="botaofechapar">
                <button type="button" onclick="Inserirfechapar()">FechaPar</button>
            </div>
            <div class="botao+">
                <button type="button" onclick="InserirValor('+')">+</button>
            </div>
            <div class="botao-">
                <button type="button" onclick="InserirValor('-')">-</button>
            </div>
            <div class="botao*">
                <button type="button" onclick="InserirValor('*')">*</button>
            </div>
            <div class="botao/">
                <button type="button" onclick="InserirValor('/')">/</button>
            </div>
            <div class="botao√">
                <button type="button" onclick="InserirValor('√')">√</button>
            </div>
            <div class="botao^">
                <button type="button" onclick="InserirValor('^')">^</button>
            </div>
            <div class="botao!">
                <button type="button" onclick="InserirValor('!')">!</button>
            </div>
            <div class="botao1">
                <button type="button" onclick="InserirValor(1)">1</button>
            </div>
            <div class="botao2">
                <button type="button" onclick="InserirValor(2)">2</button>
            </div>
            <div class="botao3">
                <button type="button" onclick="InserirValor(3)">3</button>
            </div>
            <div class="botao4">
                <button type="button" onclick="InserirValor(4)">4</button>
            </div>
            <div class="botao5">
                <button type="button" onclick="InserirValor(5)">5</button>
            </div>
            <div class="botao6">
                <button type="button" onclick="InserirValor(6)">6</button>
            </div>
            <div class="botao7">
                <button type="button" onclick="InserirValor(7)">7</button>
            </div>
            <div class="botao8">
                <button type="button" onclick="InserirValor(8)">8</button>
            </div>
            <div class="botao9">
                <button type="button" onclick="InserirValor(9)">9</button>
            </div>
            <div class="botao0">
                <button type="button" onclick="InserirValor(0)">0</button>
            </div>
            <div class="botaoapagar">
                <button type="button" onclick="ApagarValor()">Apagar</button> 
            </div>
            <div class="botaoenviar">
                <button type="button" onclick="EnviarValor()">Resultado</button>
            </div>
        </div>

        <script>

            var operadorAnterior = null;
            var abrepar = "("
            var fechapar = ")"

            function InserirValor(valor) {
                var i = document.getElementById("valor");
                if (operadorAnterior === null && valor === "+") {
                    return;
                } else if (operadorAnterior === null && valor === "-") {
                    return;
                } else if (operadorAnterior === null && valor === "*") {
                    return;
                } else if (operadorAnterior === null && valor === "/") {
                    return;
                } else if (operadorAnterior === null && valor === "√") {
                    return;
                } else if (operadorAnterior === null && valor === "^") {
                    return;
                } else if (operadorAnterior === null && valor === "!") {
                    return;
                } else if (operadorAnterior === null && valor === "-") {
                    return;
                } else if (operadorAnterior === null && valor === ")") {
                    return;
                } else if ((operadorAnterior === "+" || operadorAnterior === "-" || operadorAnterior === "*" || operadorAnterior === "/" || operadorAnterior === "√" || operadorAnterior === "^" || operadorAnterior === "!" ) && (valor === "+" || valor === "-" || valor === "*" || valor === "/" || valor === "√" || valor === "^" || valor === "!")) {
                    return;
                } else {
                    i.value += valor;
                    operadorAnterior = valor;
                }
            }
            function Inserirabrepar(){
                var i = document.getElementById("valor")
                i.value += abrepar
            }
            function Inserirfechapar(){
                var i = document.getElementById("valor")
                i.value += fechapar
            }
            function ApagarValor() {
                var i = document.getElementById("valor");
                iatual = i.value;
                i.value = iatual.slice(0,-1);
            }
            function EnviarValor(valor) {
                var str = document.getElementById("valor").value;
                console.log(str);
                <?php
                    $host = "localhost";
                    $database = "Calculadora"; 
                    $user = "root";
                    $password = "";

                    $conexao = new mysqli($host, $user, $password, $database);

                    if ($conexao->connect_error) {
                        die("Erro na conexão: " . $conexao->connect_error);
                    }
 
                    $conta = $_REQUEST["valor"];
                    
                    $sql = "set @i = 0;
                        CALL E('$conta', @i, @resultado);
                        SELECT @resultado;";
                    
                    #$result = mysqli_query($conexao,$sql);

                    #while ($row = mysqli_fetch_assoc($result)) {
                        #echo $row['@resultado'];
                    #}
                ?>
            }
        </script>    
    </body>
</html>