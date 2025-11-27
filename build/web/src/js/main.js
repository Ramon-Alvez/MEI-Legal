const buttons = document.querySelectorAll("a.bttn");
let botaoAtivo = document.querySelector(".active"); // Captura o elemento ativo inicial

buttons.forEach(botao => {
    botao.addEventListener('click', () => {
        
        if (botaoAtivo) {
            botaoAtivo.classList.remove('active');
        }

        botao.classList.add('active'); 
        botaoAtivo = botao;
    });
});