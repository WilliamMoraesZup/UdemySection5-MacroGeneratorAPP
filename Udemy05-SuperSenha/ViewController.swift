//
//  ViewController.swift
//  Udemy05-SuperSenha
//
//  Created by William Moraes da Silva on 16/10/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var tfHeight: UITextField!
    @IBOutlet weak var segActivityLevel: UISegmentedControl!
    @IBOutlet weak var segGender: UISegmentedControl!
    @IBOutlet weak var optShowKcal: UISwitch!
    @IBOutlet weak var tfAge: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
 
    
    
    @IBAction func btnGenerateMacro(_ sender: UIButton) {
 
        
        
        if let unWrapWeight = tfWeight.text, let safeWeight = Int(unWrapWeight), safeWeight > 40, safeWeight < 200,
         let unWrapHeight = tfHeight.text, let safeHeight = Int(unWrapHeight), safeHeight > 100, Int(unWrapHeight)! < 220,
         let unWrapAge = tfAge.text , let safeAge = Int(unWrapAge), safeAge > 15, safeAge < 100
    {
            performSegue(withIdentifier: "nextSegue", sender: nil)
        }
        else {
            
            let alert = UIAlertController(title: "Erro", message: "Você deve preencher os campos corretamente", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
   let next = segue.destination as! MacroViewController
        
        if let weight = Int(tfWeight.text!), let height = Int(tfHeight.text!), let age = Int(tfAge.text!) {
      next.weight = weight
      next.height = height
      next.age = age
      }
        next.showKcal = optShowKcal.isOn
        next.activityLevel =  ActivityLevel.init(rawValue: segActivityLevel.selectedSegmentIndex)
        next.gender = Gender.init(rawValue: segGender.selectedSegmentIndex)
        next.showKcal = optShowKcal.isOn
      
    
        view.endEditing(true)
    }

}

