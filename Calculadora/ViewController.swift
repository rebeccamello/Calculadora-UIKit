//
//  ViewController.swift
//  Calculadora
//
//  Created by Rebecca Mello on 07/01/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numbersLabel: UILabel!
    var numberOnScreen: Double = 0;
    var num1Number: Double = 0;
    var operating = false;
    var operation = 0;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func numbers(_ sender: UIButton) {
        if operating { // se estiver fazendo uma operacao
            numbersLabel.text = String(sender.tag) // coloca o numero na label em formato de string mesmo puxando o texto da tag
            numberOnScreen = Double(numbersLabel.text!)! // salva na variavel do numero o que tiver na label da tela
            operating = false
        }
        else {
            numbersLabel.text = numbersLabel.text! + String(sender.tag)
            numberOnScreen = Double(numbersLabel.text!)!
        }
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if numbersLabel.text != "" && sender.tag != 11 && sender.tag != 16 && sender.tag != 10{ // se ja tiver um numero na tela e o botao clicado nao for o de zerar nem o de mostrar resultado (se for um de operacao)
            num1Number = Double(numbersLabel.text!)! // salva o primeiro numero
            
            if sender.tag == 12 { // caso de div
                numbersLabel.text = "/"
            }
            else if sender.tag == 13 { // caso de multi
                numbersLabel.text = "x"
            }
            else if sender.tag == 14 { // caso de menos
                numbersLabel.text = "-"
            }
            else { // caso de soma
                numbersLabel.text = "+"
            }
            
            operation = sender.tag
            operating = true
        }
        
        else if sender.tag == 10 { // se apertar a virgula
            numbersLabel.text = numbersLabel.text! + "."
            numberOnScreen = Double(numbersLabel.text!)!
        }
        
        else if sender.tag == 11 { // se apertar o de zerar
            numbersLabel.text = ""
            operating = false
            operation = -1
            num1Number = 0
            numberOnScreen = 0
        }
        
        else if sender.tag == 16 { // se apertar o de mostrar resultado
            var res: Double = 0
            
            if operation == 12 {
                if numbersLabel.text != "0" {
                    res = num1Number / numberOnScreen
                }
            }
            
            else if operation == 13 {
                res = num1Number * numberOnScreen
            }
            
            else if operation == 14 {
                res = num1Number - numberOnScreen
            }
            
            else {
                res = num1Number + numberOnScreen
            }
            
            numbersLabel.text = String(res)
        }
    }
}

