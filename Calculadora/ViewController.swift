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
    var tappedComma = false
    var res: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func numbers(_ sender: UIButton) {
        tapNumber(number: sender.tag)
    }
    
    func tapNumber(number: Int) {
        if operating { // se estiver fazendo uma operacao
            numbersLabel.text = String(number) // coloca o numero na label em formato de string mesmo puxando o texto da tag
            numberOnScreen = Double(numbersLabel.text!)! // salva na variavel do numero o que tiver na label da tela
            operating = false
        }
        else {
            if numbersLabel.text != nil {
                numbersLabel.text = numbersLabel.text! + String(number)
            } else {
                numbersLabel.text = String(number)
            }
//            numbersLabel.text = numbersLabel.text! + String(sender.tag)
            numberOnScreen = Double(numbersLabel.text!)!
        }
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if numbersLabel.text != "" && sender.tag != 11 && sender.tag != 16 && sender.tag != 10 { // se ja tiver um numero na tela e o botao clicado nao for o de zerar nem o de mostrar resultado (se for um de operacao)
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
            
            if tappedComma {
                tappedComma.toggle()
            }
            
            operation = sender.tag
            operating = true
        }
        
        else if numbersLabel.text == "" && sender.tag == 14 { // caso do primeiro numero ser negativo
            numbersLabel.text = "-"
        }
        
        else if sender.tag == 10 { // se apertar a virgula
            if !tappedComma {
                numbersLabel.text = numbersLabel.text! + "."
                numberOnScreen = Double(numbersLabel.text!)!
                tappedComma.toggle()
            }
        }
        
        else if sender.tag == 11 { // se apertar o de zerar
            numbersLabel.text = ""
            operating = false
            operation = -1
            num1Number = 0
            numberOnScreen = 0
            tappedComma = false
        }
        
        else if sender.tag == 16 { // se apertar o de mostrar resultado
            
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

