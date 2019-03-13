//
//  NewUserRegisterViewController.swift
//  PhilosophyNotificationApp
//
//  Created by takafumi onodera on 2019/01/17.
//  Copyright © 2019年 takafumi onodera. All rights reserved.
//

import UIKit
import FirebaseAuth

class NewUserRegisterViewController: UIViewController {
    @IBOutlet weak var mailAddressTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func tapRegisterButton(_ sender: Any) {
        let alert: UIAlertController = UIAlertController(title: "", message: "メールアドレス、パスワードを入力して下さい", preferredStyle:  UIAlertControllerStyle.alert)
        let okButtonAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
            (action: UIAlertAction!) -> Void in
        })
        alert.addAction(okButtonAction)
        
        guard let mailAddress = mailAddressTextField.text, !mailAddress.isEmpty else {
            // 異常系処理
            present(alert, animated: true, completion: nil)
            return
        }
        
        guard let password = passWordTextField.text, !password.isEmpty else {
            // 異常系処理
            present(alert, animated: true, completion: nil)
            return
        }
        

        Auth.auth().createUser(withEmail: mailAddress, password: password){ (authResult, error) in
            guard let user = authResult?.user else {
                // TODO 異常系処理実装
                return
            }
            // TODO 正常系処理実装
        }
        
        // TODO 遷移は成功時処理に回す
        performSegue(withIdentifier: "homeView", sender: nil)
    }
    
}
