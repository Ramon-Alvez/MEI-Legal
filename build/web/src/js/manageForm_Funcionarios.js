
const form = document.getElementById("form");
const error_text = document.querySelectorAll(".data_error");

const regexApenasLetras = /^[A-Za-zÀ-ÖØ-öø-ÿ\s]+$/;
const regexCPF = /^\d{3}\.\d{3}\.\d{3}-\d{2}$/;
const regexEmail = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;
const regexTelefone = /^\d{2}\s\d{5}-\d{4}$/;


form.addEventListener('submit', (e) => {
    e.preventDefault();

    let nome = document.getElementById('nome').value;
    let cpf = document.getElementById('cpf').value;
    let email = document.getElementById('email').value;
    let telefone = document.getElementById('telefone').value;

    let errors = [];

    let data = {
        nome: nome,
        cpf: cpf,
        email: email,
        telefone: telefone,

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


    // Validando o Email
    if (email === "") data.errors[2] = 'O Email é obrigatório!';
    else if (!regexEmail.test(email)) data.errors[2] = 'Email inválido!';


    // Validando o Telefone
    if (telefone === "") data.errors[3] = 'O Telefone é obrigatório!';
    else if (telefone.length < 13) data.errors[3] = 'Telefone inválido! Favor seguir o modelo XX XXXXX-XXXX.';
    else if (!regexTelefone.test(telefone)) data.errors[3] = 'Telefone inválido! Favor seguir o modelo XX XXXXX-XXXX.';

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
