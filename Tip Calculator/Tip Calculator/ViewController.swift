//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Lambros Tzanetos on 23/08/16.
//  Copyright © 2016 Mogul Asterovska. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate {
//boro na xrisimopoiso function gia kathe fora pou patiete + - button
 //   ta kano ola text fields
    
//constraints ktl

    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipPercentLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var numberOfPeopleLabel: UILabel! //vazo na min ginete nane <1
    @IBOutlet weak var individualsPayLabel: UILabel!
    
    
    ///Pay + Receive Money
    @IBOutlet var paidAmount: UITextField!
    @IBOutlet var changeReceived: UITextField!
    
    //
    //var paymentsArray = [paymentInfo]()
    var paymentsTable = [String]()
    //
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        billAmountTextField.text = "0"
        tipPercentLabel.text = "0"
        tipAmountLabel.text = "0"
        numberOfPeopleLabel.text = "0"
        totalAmountLabel.text = "0"
        individualsPayLabel.text = "0"
        
        reCalculateData()  //might occasionaly get errors
        
    }
    var tipMultiplier = 0.0
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
        //reCalculateData()
        self.view.endEditing(true)
        //Controlling keyboard - And making it responsive when user enters new value
    }

    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    func reCalculateData() {
        tipMultiplier = Double(tipPercentLabel.text!)! * 0.01
        
        tipAmountLabel.text = String(Int(Double(billAmountTextField.text!)! * tipMultiplier)) // to modaro gia periptoseis pou einai = 0
        
        totalAmountLabel.text = String(Int(tipAmountLabel.text!)! + Int(billAmountTextField.text!)!)
        
        if numberOfPeopleLabel.text == "0" {
            individualsPayLabel.text = totalAmountLabel.text
        } else {
            individualsPayLabel.text = String((Int(totalAmountLabel.text!))!/(Int(numberOfPeopleLabel.text!))!)
        
        }
    }
    
    
    @IBAction func clearAction(_ sender: AnyObject) {
        billAmountTextField.text = "0"
        tipPercentLabel.text = "0"
        tipAmountLabel.text = "0"
        numberOfPeopleLabel.text = "0"
        totalAmountLabel.text = "0"
        individualsPayLabel.text = "0"
        
    }
    
    @IBAction func billAmountAdd(_ sender: AnyObject) {
        billAmountTextField.text = String(Int(billAmountTextField.text!)! + 1)
        reCalculateData()
    }
    
    @IBAction func billAmountSubtract(_ sender: AnyObject) {
        billAmountTextField.text = String(Int(billAmountTextField.text!)! - 1)
        reCalculateData()
    }
    
    
   
    @IBAction func addTipPercent(_ sender: AnyObject) {
        tipPercentLabel.text = String(Int(tipPercentLabel.text!)! + 1)
        reCalculateData()
        
    }
    
    @IBAction func subtractTipPercent(_ sender: AnyObject) {
        tipPercentLabel.text = String(Int(tipPercentLabel.text!)! - 1)
        reCalculateData()
    }
    
    @IBAction func tipAmountAdd(_ sender: AnyObject) {
   
        tipAmountLabel.text = String(Int(tipAmountLabel.text!)! + 1)
        tipPercentLabel.text = String(Int(Double(Double(tipAmountLabel.text!)!/Double(billAmountTextField.text!)! * 100.00)))
     //   reCalculateData()
        
        tipMultiplier = Double(Double(tipAmountLabel.text!)!/Double(billAmountTextField.text!)!)
        totalAmountLabel.text = String(Int(tipAmountLabel.text!)! + Int(billAmountTextField.text!)!)
        if numberOfPeopleLabel.text == "0" {
            individualsPayLabel.text = totalAmountLabel.text
        } else {
            individualsPayLabel.text = String((Int(totalAmountLabel.text!))!/(Int(numberOfPeopleLabel.text!))!)
            
        }

    }
    
    @IBAction func tipAmountSubtract(_ sender: AnyObject) {
        tipAmountLabel.text = String(Int(tipAmountLabel.text!)! - 1)
        tipPercentLabel.text = String(Int(Double(Double(tipAmountLabel.text!)!/Double(billAmountTextField.text!)!) * 100))
        reCalculateData()
        
    }
    
    
    @IBAction func numberOfPeopleAdd(_ sender: AnyObject) {
        
        //vazo if gia otan paei <=0
        
        numberOfPeopleLabel.text = String(Int(numberOfPeopleLabel.text!)! + 1)
        reCalculateData()
        
    }
    
    
    @IBAction func numberOfPeopleSubtract(_ sender: AnyObject) {
        
        //vazo if gia otan paei <=0
        numberOfPeopleLabel.text = String(Int(numberOfPeopleLabel.text!)! - 1)
        reCalculateData()
        
    }
    
    @IBAction func totalAmountAdd(_ sender: AnyObject) {
        totalAmountLabel.text = String(Int(totalAmountLabel.text!)! + 1)
        tipAmountLabel.text = String(Int(totalAmountLabel.text!)! - Int(billAmountTextField.text!)!)
        tipPercentLabel.text = String(Int(Double(Double(tipAmountLabel.text!)!/Double(billAmountTextField.text!)! * 100.00)))
        
        tipMultiplier = Double(Double(tipAmountLabel.text!)!/Double(billAmountTextField.text!)!)
        totalAmountLabel.text = String(Int(tipAmountLabel.text!)! + Int(billAmountTextField.text!)!)
        individualsPayLabel.text = String((Int(totalAmountLabel.text!))!/(Int(numberOfPeopleLabel.text!))!)
        
    }
    
    @IBAction func totalAmountSubtract(_ sender: AnyObject) {
        
        totalAmountLabel.text = String(Int(totalAmountLabel.text!)! - 1)
        tipAmountLabel.text = String(Int(totalAmountLabel.text!)! - Int(billAmountTextField.text!)!)
        tipPercentLabel.text = String(Int(Double(Double(tipAmountLabel.text!)!/Double(billAmountTextField.text!)! * 100.00)))
        
        tipMultiplier = Double(Double(tipAmountLabel.text!)!/Double(billAmountTextField.text!)!)
        totalAmountLabel.text = String(Int(tipAmountLabel.text!)! + Int(billAmountTextField.text!)!)
        individualsPayLabel.text = String((Int(totalAmountLabel.text!))!/(Int(numberOfPeopleLabel.text!))!)
        
        
        /* - Can also work but is not preffered as the subtraction is direct 
         
        tipAmountLabel.text = String(Int(tipAmountLabel.text!)! - 1)
        tipPercentLabel.text = String(Int(Double(Double(tipAmountLabel.text!)!/Double(billAmountTextField.text!)! * 100.00)))
       
        tipMultiplier = Double(Double(tipAmountLabel.text!)!/Double(billAmountTextField.text!)!)
        totalAmountLabel.text = String(Int(tipAmountLabel.text!)! + Int(billAmountTextField.text!)!)
        individualsPayLabel.text = String((Int(totalAmountLabel.text!))!/(Int(numberOfPeopleLabel.text!))!) 
         
         */
        
    }
    
    
    @IBAction func individualsPayAdd(_ sender: AnyObject) {
        
        //ksana koitao afto kai to subtract version tou
        
        //Can also say individualsPayLabel.text = String((Int(totalAmountLabel.text!)! + 1) here instead of letting it being the result of further calculation
        totalAmountLabel.text = String(Int(totalAmountLabel.text!)! + (1 * Int(numberOfPeopleLabel.text!)!))  // add 1 multiplied by the number of people
        tipAmountLabel.text = String(Int(totalAmountLabel.text!)! - Int(billAmountTextField.text!)!)
        tipPercentLabel.text = String(Int(Double(Double(tipAmountLabel.text!)!/Double(billAmountTextField.text!)! * 100.00)))
        
        tipMultiplier = Double(Double(tipAmountLabel.text!)!/Double(billAmountTextField.text!)!)
        totalAmountLabel.text = String(Int(tipAmountLabel.text!)! + Int(billAmountTextField.text!)!)
        individualsPayLabel.text = String((Int(totalAmountLabel.text!))!/(Int(numberOfPeopleLabel.text!))!)
        
    }
    
    
    @IBAction func individualsPaySubtract(_ sender: AnyObject) {
    
        //ksana koitao afto kai to subtract version tou

        //Can also say individualsPayLabel.text = String((Int(totalAmountLabel.text!)! - 1) here instead of letting it being the result of further calculation
        
        totalAmountLabel.text = String(Int(totalAmountLabel.text!)! - (1 * Int(numberOfPeopleLabel.text!)!))  // add 1 multiplied by the number of people
        tipAmountLabel.text = String(Int(totalAmountLabel.text!)! - Int(billAmountTextField.text!)!)
        tipPercentLabel.text = String(Int(Double(Double(tipAmountLabel.text!)!/Double(billAmountTextField.text!)! * 100.00)))
        
        tipMultiplier = Double(Double(tipAmountLabel.text!)!/Double(billAmountTextField.text!)!)
        totalAmountLabel.text = String(Int(tipAmountLabel.text!)! + Int(billAmountTextField.text!)!)
        individualsPayLabel.text = String((Int(totalAmountLabel.text!))!/(Int(numberOfPeopleLabel.text!))!)
        
        
    }
    
    
    @IBAction func pay(_ sender: AnyObject) {
        if let check1 = Double(paidAmount.text!) , let check2 = Double(individualsPayLabel.text!) {
            changeReceived.text = String(Double(paidAmount.text!)! - Double(individualsPayLabel.text!)!)
            //Then add data to history
            
            //let newPaymentInfo = paymentInfo(totalAmount: totalAmountLabel.text!, individualAmount: individualsPayLabel.text!, amountPaid: paidAmount.text!, changeReceived: changeReceived.text!)
           
            
          /*  if var existingArray = UserDefaults.standard.object(forKey: "payments") as? Array<paymentInfo> {
                existingArray.append(newPaymentInfo)
                UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: existingArray), forKey: "payments")
            }
            else {
                print("eieo")
                paymentsArray.append(newPaymentInfo)
                UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: paymentsArray), forKey: "payments")
            } */
            
            if var existingArray = UserDefaults.standard.object(forKey: "payments") as? Array<String> {
                existingArray.append("Total Amount: \(totalAmountLabel.text!)    Individual Amount: \(individualsPayLabel.text!)\nAmount Paid: \(paidAmount.text!)    Change Received: \(changeReceived.text!)")
                print("FFF \(existingArray)")
                UserDefaults.standard.set(existingArray, forKey: "payments")
            }
            else {
                print("eieo")
                paymentsTable.append("Total Amount: \(totalAmountLabel.text!)  Individual Amount: \(individualsPayLabel.text!)\nAmount Paid: \(paidAmount.text!)  Change Received: \(changeReceived.text!)")
                UserDefaults.standard.set(paymentsTable, forKey: "payments")
            }

        }
    }
    
 
 
 

}

