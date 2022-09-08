//
//  ViewController.swift
//  IMC
//
//  Created by Ana Paula Lesniovski dos Santos on 27/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var tfHeight: UITextField!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var ivResult: UIImageView!
    @IBOutlet weak var viResult: UIView!
    
    var imc: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func calculate(_ sender: Any) {
        let numberFormatter = NumberFormatter()
        if let weight = numberFormatter.number(from:  tfWeight.text!)?.doubleValue, let height = numberFormatter.number(from: tfHeight.text!)?.doubleValue {
            imc = weight / (height*height)
            showResults()
        }
    }
    
    func showResults() {
        var result: String = ""
        var image: String = ""
        switch imc {
        case 0..<16:
            result = "Desnutrição"
            image = "magreza"
        case 16..<18.5:
            result = "Abaixo do peso"
            image = "abaixo"
        case 18..<25:
            result = "Eutrofia"
            image = "ideal"
        case 25..<30:
            result = "Sobrepeso"
            image = "sobre"
        default:
            result = "Obesidade"
            image = "obesidade"
        }
        
        lbResult.text = "\(Int(imc)) kg/m2: \(result)"
        ivResult.image = UIImage(named: image)
        viResult.isHidden = false
        view.endEditing(true)
    }
    
}


