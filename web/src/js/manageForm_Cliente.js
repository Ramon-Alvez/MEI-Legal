
const form = document.getElementById("form");
const error_text = document.querySelectorAll(".data_error");

const regexApenasLetras = /^[A-Za-zÀ-ÖØ-öø-ÿ\s]+$/;
const regexCPF = /^\d{3}\.\d{3}\.\d{3}-\d{2}$/;


form.addEventListener('submit', (e) => {
    e.preventDefault();

    let nome = document.getElementById('nome').value;
    let cpf = document.getElementById('cpf').value;
    let idade = document.getElementById('idade').value;
    let dataCadastro = document.getElementById('dataCadastro').value;

    let errors = [];

    let data = {
        nome: nome,
        cpf: cpf,
        idade: idade,
        dataCadastro: dataCadastro,

        errors: errors,
        isValidData: true
    };
    
    
    // Limpando erros na tela (Se houverem)
    error_text.forEach(p => {
        p.textContent = '';
    });



    // Validando o Nome
    if (nome === "") data.errors[0] = 'O Nome é obrigatório!';
    else if (nome.length < 3) data.errors[0] = 'Nome inválido!';
    else if (!regexApenasLetras.test(nome)) data.errors[0] = 'Caracteres inválidos! Utilizar somente letras Maiúsculas e Minúsculas.';


    // Validando o CPF
    if (cpf === "") data.errors[1] = 'O CPF é obrigatório!';
    else if (!regexCPF.test(cpf)) data.errors[1] = 'CPF inválido! Favor preencher conforme o modelo XXX.XXX.XXX-XX.';


    // Validando a Idade
    if (idade === "") data.errors[2] = 'A Idade é obrigatória!';
    else if (idade < 16) data.errors[2] = 'Idade inválida! Idade mínima necessária é 16 anos.';
    else if (idade.length < 2) data.errors[2] = 'Idade inválida!';


    // Validando a Data de Cadastro
    if (dataCadastro === "") data.errors[3] = 'A Data de Cadastro é obrigatória!';
    

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
