//
//  CalculadoraTests.swift
//  CalculadoraTests
//
//  Created by Rebecca Mello on 07/01/22.
//

import XCTest
@testable import Calculadora
import UIKit

class ViewControllerTests: XCTestCase {
    
    var sut: ViewController! // system under test
    let sumBut = UIButton(type: .system)
    let minusBut = UIButton(type: .system)
    let resultBut = UIButton(type: .system)
    let comma = UIButton(type: .system)
    let multiBut = UIButton(type: .system)
    let divButton = UIButton(type: .system)
    let clean = UIButton(type: .system)

    override func setUp() { // quando começa o teste, inicia o sut na view controller
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "Main") as? ViewController
        sut.loadView()
        
        comma.tag = 10
        sumBut.tag = 15
        resultBut.tag = 16
        minusBut.tag = 14
        multiBut.tag = 13
        divButton.tag = 12
        clean.tag = 11
    }

    override func tearDown() { // quando termina o teste, limpa
        sut = nil
    }
    
    func testTapNumber() { // inserir dois numeros
        sut.tapNumber(number: 4)
        sut.tapNumber(number: 5)
        
        XCTAssertEqual(sut.numberOnScreen, 45)
    }
    
    func testOneComma() { // nao pode permitir inserir mais de uma virgula
        sut.tapNumber(number: 4)
        sut.buttons(comma)
        sut.tapNumber(number: 5)
        sut.buttons(comma)
        sut.tapNumber(number: 5)
        
        XCTAssertEqual(sut.numbersLabel.text, "4.55")
    }
    
    func testSum() {
        sut.tapNumber(number: 4)
        sut.tapNumber(number: 5)
        sut.buttons(sumBut)
        sut.tapNumber(number: 5)
        sut.buttons(resultBut)
    }
    
    func testSumWithFirstNegative() {
        sut.buttons(minusBut)
        sut.tapNumber(number: 4)
        sut.buttons(sumBut)
        sut.tapNumber(number: 5)
        sut.buttons(resultBut)
        
        XCTAssertEqual(sut.res, 1.0)
    }
    
    func testMinus() {
        sut.tapNumber(number: 4)
        sut.tapNumber(number: 5)
        sut.buttons(minusBut)
        sut.tapNumber(number: 5)
        sut.buttons(resultBut)
        
        XCTAssertEqual(sut.numbersLabel.text, "40.0")
    }
    
    func testMulti() {
        sut.tapNumber(number: 4)
        sut.buttons(multiBut)
        sut.tapNumber(number: 5)
        sut.buttons(resultBut)
        
        XCTAssertEqual(sut.res, 20.0)
    }
    
    func testDiv() {
        sut.tapNumber(number: 4)
        sut.tapNumber(number: 5)
        sut.buttons(divButton)
        sut.tapNumber(number: 5)
        sut.buttons(resultBut)
        
        XCTAssertEqual(sut.res, 9.0)
    }
    
    func testClean() {
        sut.tapNumber(number: 4)
        sut.tapNumber(number: 5)
        sut.buttons(divButton)
        sut.tapNumber(number: 5)
        sut.buttons(resultBut)
        sut.buttons(clean)
        
        XCTAssertEqual(sut.operating, false)
    }
}
