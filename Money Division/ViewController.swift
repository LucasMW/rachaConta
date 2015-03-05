//
//  ViewController.swift
//  Money Division
//
//  Created by Daphne Schinazi on 3/5/15.
//  Copyright (c) 2015 Daphne Schinazi. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet var PriceTextField: UITextField!
    @IBOutlet var number: UILabel!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var Stepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Stepper.minimumValue=1;
        number.text = "1"
        PriceTextField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func StepperChanged(sender: UIStepper) {
        number.text = Int(sender.value).description
        resultLabel.text = String(format:"%.2lf",calculateResult((PriceTextField.text as NSString).doubleValue,  pessoas: Int(sender.value)));
    }

    @IBAction func valorDaConta(sender: UITextField) {
        resultLabel.text = String(format:"%.2lf",calculateResult((sender.text as NSString).doubleValue,  pessoas: Int(Stepper.value)));
        println(resultLabel.text);
    }
    func calculateResult( conta:Double, pessoas:Int ) ->Double
    {
     
        return conta / Double(pessoas);
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {   //delegate method
        textField.resignFirstResponder()
        resultLabel.text = String(format:"%.2lf",calculateResult((textField.text as NSString).doubleValue,  pessoas: Int(Stepper.value)));
        println(resultLabel.text);
        return true
    }
}

