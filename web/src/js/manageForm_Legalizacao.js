
const form = document.getElementById("form");
const error_text = document.querySelectorAll(".data_error");


form.addEventListener('submit', (e) => {
    e.preventDefault();

    let tipoProcesso = document.getElementById('tipoProcesso').value;
    let faseProcesso = document.getElementById('faseProcesso').value;
    let idCliente = document.getElementById('idCliente').value;
    let idFuncionario = document.getElementById('idFuncionario').value;
    let idFornecedor = document.getElementById('idFornecedor').value;

    let errors = [];

    let data = {
        tipoProcesso: tipoProcesso,
        faseProcesso: faseProcesso,
        idCliente: idCliente,
        idFuncionario: idFuncionario,
        idFornecedor: idFornecedor,

        errors: errors,
        isValidData: true
    };
    
    
    // Limpando erros na tela (Se houverem)
    error_text.forEach(p => {
        p.textContent = '';
    });



    // Validando o Cliente | ID Cliente
    if (idCliente === "") data.errors[0] = 'Selecione um Cliente';
    
    
    // Validando o Tipo do Processo
    if (tipoProcesso === "") data.errors[1] = 'Selecione o Tipo do Processo';
     

    // Validando a Razão Social | ID Fornecedor
    if (idFornecedor === "") data.errors[2] = 'Selecione a Razão Social desejada';
  

    // Validando o Funcionário| ID Funcionário
    if (idFuncionario === "") data.errors[3] = 'Selecione um Funcionário';
    
    
    // Validando a Fase do Processo
    if (faseProcesso === "") data.errors[4] = 'Selecione a Fase do Processo';
   

  
    // Mostrando os erros na tela (Se houverem)
    if (errors.length > 0) {
        errors.forEach((error, i) => {
            error_text[i].textContent = error;
        });
        data.isValidData = false;
    } else data.isValidData = true;


    // Enviando formulário caso não haja erros
    if (data.isValidData === true) form.submit();
});
