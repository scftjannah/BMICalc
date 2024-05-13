//
//  BMICalcViewController.swift
//  BMICalc
//
//  Created by Aiman Daniel on 13/05/2024.
//

import UIKit

class BMICalcViewController: UIViewController, UITextFieldDelegate {
    
   
    
    @IBOutlet weak var heightTextField: UITextField!
    
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBOutlet weak var bmiValueTextField: UILabel!
    
    @IBOutlet weak var classTextField: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heightTextField.delegate = self
        weightTextField.delegate = self
        heightTextField.text = ""
        weightTextField.text = ""
        bmiValueTextField.text = "BMI Calculator"
        classTextField.text = "Enter Height and Weight"

        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    
    @IBAction func calculateBMI(_ sender: UIButton) {
        guard let heightTextField = heightTextField.text, let weightTextField = weightTextField.text else {
            return
        }
        let weightString = weightTextField
        let heightString = heightTextField
        var classString=""
        var bmiResultString=""
        
        if let weight = Double(weightString), let height = Double(heightString), weight>0, height>0{
            
            let bmiResult = weight/(height*height)
            
            
            
            switch bmiResult {
                
            case let bmiResult where bmiResult<18.5:
                classString = "Underweight"
            case let bmiResult where bmiResult<24.9:
                classString = "Healthy Weight"
            case let bmiResult where bmiResult<29.9:
                classString = "Overweight"
            case let bmiResult where bmiResult>30.0:
                classString = "Obesity"
            default:
                classString = "Error"
            }
            
            bmiResultString = String((bmiResult*10).rounded()/10)
        }
        else {
            classString = "Error"
            bmiResultString = "Error"
        }
        bmiValueTextField.text = bmiResultString
        classTextField.text = classString
        print(classString)

    }
}
