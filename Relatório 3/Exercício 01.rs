use std::io;

fn validar_placa(placa:&str) -> bool{
    if placa.len() >= 7{ 
        let mut maiu = 0;
        let mut dig = 0;
        for c in placa.chars() {
            if c.is_digit(10) {
                dig += 1;
            }
            if c.is_ascii_uppercase() {
                maiu += 1;
                }
            }
        if dig >= 2 && maiu >= 4 {
            true
        }else{
            false
        }
    }else{
        false
    }
}

fn main() {
    let mut placa = String::new();

    loop {
        println!("Digite a Placa");
        io::stdin().read_line(&mut placa).expect("Erro ao ler");

        if !validar_placa(&placa) {
            println!("Placa invalida, Tenta novamente");
        }else{
            println!("Placa cadastrada no sistema");
            break;
        }
    }
}