//
//  MacroPlanGenerator.swift
//  Udemy05-SuperSenha
//
//  Created by William Moraes da Silva on 16/10/21.
//

import Foundation

class MacroGenerator{
    var weight : Int
    var height : Int
    var age : Int
    var activityLevel : ActivityLevel
    var gender : Gender
    var optSwitch : Bool
    
    
    
    init(weight : Int, height : Int, age : Int, activityLevel : ActivityLevel, gender : Gender, optSwitch : Bool) {
        self.weight = weight
        self.height = height
        self.age = age
        self.activityLevel = activityLevel
        self.gender = gender
        self.optSwitch = optSwitch
        
    }
    
    
    func BMRGenerate() -> Double{
        switch gender {
        case .MAN:  return calcMan()
        default:    return calcWoman()
        }
        
        
    }
    
    
  private  func calcWoman() -> Double{
        
    var tmb = 665.1 + (9.56 * Double(weight)) + (1.8 * Double(height)) - (4.7 * Double(age))
   tmb = activityLevel.addActivityBurn(tmb: tmb)
    
        return tmb
    }
    
    private func calcMan() -> Double{
        
        var tmb = 66.5 + (13.75 * Double(weight)) + (5.0 * Double(height)) - (6.8 * Double(age))

        tmb = activityLevel.addActivityBurn(tmb: tmb)
         
             return tmb
        
    }
    
    func highProtRecompDiet() -> String{
        var kcalBase = BMRGenerate()
        
        let threeGramsProtByKilo = weight * 3
        let threeGramsProtByKiloTotalKcal = threeGramsProtByKilo * 4
        
        kcalBase -= Double(threeGramsProtByKiloTotalKcal)
        
        let twoGramsCarbByKilo = weight * 2
        let twoGramsCarbByKiloTotalKcal = twoGramsCarbByKilo * 4
        
         
        kcalBase -= Double(twoGramsCarbByKiloTotalKcal)
      
        let remaingWithFat = kcalBase / 9
        let remaingWithFatTotalKcal = remaingWithFat * 9
        
        print(Int(threeGramsProtByKilo))
        print(Int(twoGramsCarbByKilo))
        print(Int(remaingWithFat))
       
       return """
            High-Protein Recomp Diet
            
            Prot: \(Int(threeGramsProtByKilo)) grams
            Carb: \(Int(twoGramsCarbByKilo)) grams
            Gord: \(Int(remaingWithFat)) grams
            """ 
      
    }

    func highCarbGenerator(){
        
    }
    
    func fiftyGenerator()  -> String{
            var kcalBase = BMRGenerate()
            
        let fiftyCarb = kcalBase * 0.4
        let fiftyProt = kcalBase * 0.4
        let remaingFat = kcalBase * 0.2
        
      
          
           return """
                50-50 Clean Bulk Diet
                
                Prot: \(Int(fiftyProt)/4) grams
                Carb: \(Int(fiftyCarb)/4) grams
                Gord: \(Int(remaingFat)/9) grams
                """ 
    }
}
