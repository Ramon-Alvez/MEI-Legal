
const form = document.getElementById("form");
const error_text = document.querySelectorAll(".data_error");

const regexCNPJ = /^\d{2}\.\d{3}\.\d{3}\/\d{4}\-\d{2}$/;
const regexEmail = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;
const regexTelefone = /^\d{2}\s\d{5}-\d{4}$/;


form.addEventListener('submit', (e) => {

    e.preventDefault();

    let razaoSocial = document.getElementById('razaoSocial').value;
    let cnpj = document.getElementById('cnpj').value;
    let servico = document.getElementById('servico').value;
    let telefone = document.getElementById('telefone').value;
    let email = document.getElementById('email').value;

    let errors = [];

    let data = {
        razaoSocial: razaoSocial,
        cnpj: cnpj,
        servico: servico,
        telefone: telefone,
        email: email,

        errors: errors,
        isValidData: true
    };


    // Limpando erros na tela (Se houverem)
    error_text.forEach(p => {
        p.textContent = '';
    });



    // Validando o Razão Social
    if (razaoSocial === "")
        data.errors[0] = 'A Razão Social é obrigatória!';
    else if (razaoSocial.length < 4)
        data.errors[0] = 'Razão Social inválida!';


    // Validando o CNPJ
    if (cnpj === "")
        data.errors[1] = 'O CNPJ é obrigatório!';
    else if (!regexCNPJ.test(cnpj))
        data.errors[1] = 'CNPJ inválido! Favor preencher conforme o modelo XX.XXX.XXX/XXXX-XX.';


    // Validando o Serviço Prestado
    if (servico === "")
        data.errors[2] = 'O tipo de Serviço Prestado é obrigatório!';
    else if (servico.length < 3)
        data.errors[2] = 'Serviço Prestado inválido!';


    // Validando o Telefone
    if (telefone === "")
        data.errors[3] = 'O Telefone é obrigatório!';
    else if (telefone.length < 13)
        data.errors[3] = 'Telefone inválido! Favor seguir o modelo XX XXXXX-XXXX.';
    else if (!regexTelefone.test(telefone))
        data.errors[3] = 'Telefone inválido! Favor seguir o modelo XX XXXXX-XXXX.';


    // Validando o Email
    if (email === "")
        data.errors[4] = 'O Email é obrigatório!';
    else if (!regexEmail.test(email))
        data.errors[4] = 'Email inválido!';


    // Mostrando os erros na tela (Se houverem)
    if (errors.length > 0) {
        errors.forEach((error, i) => {
            error_text[i].textContent = error;
        });
        data.isValidData = false;
    } else
        data.isValidData = true;

    // Enviando formulário caso não haja erros
    if (data.isValidData === true)
        form.submit();
});
