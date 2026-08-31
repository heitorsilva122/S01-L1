use std::io;

fn acertou_o_alvo(palpite: i32, numero_secreto: i32) -> bool {
        if palpite >= numero_secreto {
        let dif = palpite - numero_secreto;
        if dif <= 5 {
            true
        } else {
            false
        }
    } else {
        let dif = numero_secreto - palpite;
        if dif <= 5 {
            true
        } else {
            false
        }
    }
}

fn main() {
    let numero_secreto = 29;

    loop {
        println!("Digite seu palpite:");

        let mut entrada = String::new();
        io::stdin().read_line(&mut entrada).expect("Erro ao ler");
        let palpite: i32 = entrada.trim().parse().unwrap_or(0);

        if !acertou_o_alvo(palpite, numero_secreto) {
            println!("Voce passou longe! Tente novamente.");
        } else {
            let dif;
            if palpite > numero_secreto {
                dif = palpite - numero_secreto;
            } else {
                dif = numero_secreto - palpite;
            }
            println!("Parabens, voce acertou o alvo!");
            println!("Voce ficou a apenas '{}' unidade(s) do numero secreto", dif);
            break;
        }
    }
}