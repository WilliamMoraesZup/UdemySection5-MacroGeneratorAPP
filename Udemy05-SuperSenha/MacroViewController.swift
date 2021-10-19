//
//  MacroViewController.swift
//  Udemy05-SuperSenha
//
//  Created by William Moraes da Silva on 16/10/21.
//

import UIKit

//Duvida pro mentor
//No curso ele usa o ! force para receber os dados e passar para a classe geradora
// Qual é a forma correta?


class MacroViewController: UIViewController {
     
    @IBOutlet weak var tvGeneratedMacro: UITextView!
    var weight : Int?
    var height : Int?
    var age : Int!
    var activityLevel : ActivityLevel!
    var gender : Gender!
    var showKcal : Bool!
    
    var macroGenerator : MacroGenerator!
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
         if let validWeight = weight, let validHeight = height, let validAge = age {
            macroGenerator = MacroGenerator(weight: validWeight , height: validHeight , age: validAge, activityLevel: activityLevel, gender: gender, optSwitch: showKcal)
            let highProt =    macroGenerator.highProtRecompDiet()
            let fiftyfifty = macroGenerator.fiftyGenerator()
            
          title = "Total de calorias: " + String( Int(macroGenerator.BMRGenerate()))
            tvGeneratedMacro.text.append(highProt + "\n\n")
            tvGeneratedMacro.text.append(fiftyfifty  + "\n\n")
            
         }
      
        else
         {
         print("Erro ao preencher os dados")
    
    }
   
        
    }
    
  
}



enum Gender : Int {
    case MAN = 0
    case WOMAN
}

enum ActivityLevel : Int {
    case LOW = 0
    case MED = 1
    case HIGH = 2
    
    func addActivityBurn(tmb : Double) -> Double {
        switch self {
        case .LOW: return tmb * 1.1
        case .MED: return tmb * 1.2
        case .HIGH: return tmb * 1.3
        }
    }
}
