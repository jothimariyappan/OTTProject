//
//  Signin.swift
//  OTTProject
//
//  Created by Jo on 27/01/23.
//

import UIKit

class Signin: UIViewController {

    @IBOutlet var txtusername: UITextField!
    @IBOutlet var txtpswd: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

           //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
           //tap.cancelsTouchesInView = false

           view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    


    // MARK: - Navigation
    
    
    @IBAction func btnSiginin(_ sender: UIButton) {
        
        if txtusername.text !=  "" && txtpswd.text !=  ""{
            let navg = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChooseLanguage") as! ChooseLanguage
            
            self.navigationController?.pushViewController(navg, animated: true)
        }else{
            Alert(Message: "Empty Textfields")
        }
       
         
        }
        
        
    @IBAction func btneye(_ sender: UIButton) {
        if txtpswd.isSecureTextEntry == true{
            txtpswd.isSecureTextEntry = false
        }else{
            txtpswd.isSecureTextEntry = true
        }
    }
    
    @IBAction func btnCreataccount(_ sender: UIButton) {
        let navg = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUp") as! SignUp
        
        self.navigationController?.pushViewController(navg, animated: true)
    }
    func Alert(Message : String){
        
        let alert = UIAlertController(title: "Alert", message: Message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default)
        alert.addAction(ok)

        present(alert, animated: true)
    }
}
