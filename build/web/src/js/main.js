
const buttons = document.querySelectorAll("a.bttn");
let botaoAtivo = document.querySelector(".active");

buttons.forEach(botao => {
    botao.addEventListener('click', () => {
        botaoAtivo.classList.remove('active');
        botao.classList.toggle('ativo');
    });
});