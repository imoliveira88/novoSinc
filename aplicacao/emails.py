def notificar_clientes(tag, clientes): # Era notificarClientes

    //Adicionado por Igor Magalhães em 23OUT2023 - O SINC agora gera log diário, salvo na pasta sinc/controllers
    var fs = require('fs');
    var util = require('util');
    let date_time = new Date();
    let day = ("0" + date_time.getDate()).slice(-2);
    let month = ("0" + (date_time.getMonth() + 1)).slice(-2);
    let year = date_time.getFullYear();
    var log_file = fs.createWriteStream(__dirname + '/' + day +'-' + month + '-' + year + '-sinc.log', {flags : 'w'}); //Variável que armazena o nome do arquivo de log
    var log_stdout = process.stdout;

    console.log = function(d) { //
        log_file.write(util.format(d) + '\n');
        log_stdout.write(util.format(d) + '\n');
    };

    rel_CTRL.buildRelatorio(tag, clientes);

    console.log(JSON.stringify(clientes));

    
    notificar(0); // FUNCAO PARA NOTIFICAR 
    
    function notificar (i) {
        var cliente = clientes[i];  

        if (!cliente) {
            return console.log("EMAILS ENVIADOS!");
        }

        //encaminhamento por segmento 
        if (tag != 2 and (validarValorNoArray(cliente.IDPERFILFATURAMENTO, ['30000009', '3']) )):
            console.log("ADICIONANDO GRUPO DE COLABORADORES COMERCIAL!")
            var colaboradores = GFIN.concat(COLABORADORES_COMERCIAL)

        elif (tag != 2 and (validarValorNoArray(cliente.IDPERFILFATURAMENTO,[ '30000010', '2', '1']) )):
            console.log("ADICIONANDO GRUPO DE COLABORADORES RESIDENCIAL!")
            var colaboradores = GFIN.concat(COLABORADORES_RESIDENCIAL)

        }elif (tag != 2 and (cliente.IDPERFILFATURAMENTO == '10020000' )):
            console.log("ADICIONANDO GRUPO DE COLABORADORES VEICULAR!")
            var colaboradores = GFIN.concat(COLABORADORES_VEICULAR)

        }elif (tag != 2 and (validarValorNoArray(cliente.IDPERFILFATURAMENTO, ['20020329', '30000007', '30000028', '30000016', '5', '9']) )):
            console.log("ADICIONANDO GRUPO DE COLABORADORES INDUSTRIAL!")
            var colaboradores = GFIN.concat(COLABORADORES_INDUSTRIAL)

        }else {
            console.log("NENHUM GRUPO DE COLABORADOR ADICIONADO!")
            var colaboradores = GFIN;
        }

        if  (cliente.NOT == 'EMAIL') {
            console.log("ENVIANDO EMAIL PARA " + cliente.MATRICULA + " (" + cliente.CONTATO + ")" + " AS " + date_CTRL.getDataAtual());
            email_CTRL.enviarEmail(tag, cliente.CONTATO,  colaboradores, cliente, function (err) {if(err){console.log(err);console.log('OVERSENDING: AGUARDANDO 20 SEGUNDOS PARA CONTINUAR');setTimeout(notificar, 20000, i);}else{notificar(++i); console.log("Sucesso ! (" + cliente.MATRICULA + ")"); salvaUltimaNotificacao(cliente, tag);} });
        }else if (cliente.NOT == 'SMS') {
            console.log("ENVIANDO SMS PARA " + cliente.MATRICULA + " (" + cliente.CONTATO + ")" + " AS " + date_CTRL.getDataAtual());
            console.log('CONTATO: ' + cliente.CONTATO);
            console.log('NUMERO COMPLETO: ' + cliente.TELEFONE); 
            smser.enviarSMS(tag, cliente);
            salvaUltimaNotificacao(cliente, tag);
            notificar(++i);
        }else {
            console.log("CLIENTE SEM INFORMACAO PARA CONTATO - " + cliente.TITULO);
            notificar(++i);
        }
    }
}

#AVISO DE FATURA VENCIDA


    console.log({LOG_SINC: "ROBO VERIFICANDO FATURAS VENCIDAS EM " + date_CTRL.getDataAtual()});
    oracledb_CTRL.getFaturasVencidas(function (resp) {
        console.log({LOG_SINC: "Status da response " + resp.status});
        console.log({LOG_SINC: "Resultado da response " + resp.result});
        if (resp.status == 'success') {
            if (resp.result.length > 0) {
                var clientes = resp.result;
                var numberes = resp.result.length;
                console.log(numberes + ' FATURA(S)');
                not_CTRL.notificarClientes(TAG_FATURA_VENCIDA, trataArray (clientes));
            }else {
                console.log("NENHUMA FATURA VENCIDA ENCONTRADA.");
                rel_CTRL.buildRelatorioSemNot(TAG_FATURA_VENCIDA,'NENHUMA FATURA A SER NOTIFICADA.');
            }
        }else {
            console.log("ERRO AO CONSULTAR FATURAS VENCIDAS.");
            relatorioValido = 0;
            msgErro += '</br></br> Erro na consulta de faturas VENCIDAS';
        }
    }); 
    flag_not_faturas_vencidas = 1;


//ENVIO DO RELATORIO DIARIO
// enviarRelatorio = cron.schedule('30 16 * * *', function () {  
    console.log({LOG_SINC: "ROBO ENVIANDO RELATORIO EM " + date_CTRL.getDataAtual()});
    rel_CTRL.enviarRelatorio(relatorioValido, msgErro);
    msgErro='';
    relatorioValido=1;
    notificaErroFuncao(flag_not_faturas_prox, flag_not_faturas_vencidas, flag_not_aviso_suspensao);
// }, true); //true liga cron e false desliga 

function trataArray(contatos,tag=0) {  
    
    //indetificar que são exceções por emails
    function isExcecao (email) {
        const emailExcecao = ['fulano@gmail.com'];
        email = email.split('; ');

        //comparar se todos de exceção estão em algum email do cliente
        for (var i_excecao = 0; i_excecao < emailExcecao.length; i_excecao++) {
            for (let i_email = 0; i_email < email.length; i_email++) {
                if (email[i_email] == emailExcecao[i_excecao]){
                    return true;
                }    
            }
        }
        return false;
    }

    contatos.map(function(contato) {
        

        if(contato.EMAIL != null && !isExcecao(contato.EMAIL)) {
            contato.NOT = 'EMAIL';
            contato.CONTATO = contato.EMAIL;
        }else {
            if (contato.TIPO_TELEFONE == 'CELULAR'){
                contato.NOT = 'SMS';
                contato.CONTATO = '' + contato.TELEFONE;
            }else {
                contato.NOT = 'NULL';
            }
        }
    });
    return contatos;
}


def notificaErroFuncao (flag1,flag2,flag3) {
    msgErro = "";
    if (not flag1 or not flag2 or not flag3):

        msgErro += "" if flag1 else "O SiNC não executou a função de notificação de Faturas Próximas a Vencer</br></br>"
        msgErro += "" if flag2 else "O SiNC não executou a função de notificação de Faturas Vencidas </br></br>"

        email_CTRL.notificarErroFuncaoNotificacao(msgErro);
        console.log( msgErro);
    }
    flag_not_faturas_prox = 0;
    flag_not_faturas_vencidas = 0;
    flag_not_aviso_suspensao = 0;
}


def validarValorNoArray(val, array):
    for(a in array){
        if(array[a] == val):
            return true
    return false;