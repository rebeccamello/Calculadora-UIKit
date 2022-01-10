// Teste feito pra ver se NADA do layout vai mudar
// Roda a primeira vez com o isRecording = true, vai falhar, ai muda pra false e roda de novo

import XCTest
@testable import Calculadora
import UIKit
import SnapshotTesting

class CalculatorViewTest: XCTestCase {
    var sut: ViewController! // system under test
    
    override func setUp() { // quando começa o teste, inicia o sut na view controller
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "Main") as? ViewController
        sut.loadView()
        isRecording = false
    }

    override func tearDown() { // quando termina o teste, limpa
        sut = nil
    }
    
    func testViewLayout() {
        assertSnapshot(matching: sut, as: .image)
    }
}
