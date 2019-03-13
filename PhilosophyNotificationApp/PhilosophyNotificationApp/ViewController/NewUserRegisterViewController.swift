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
        
        // メールアドレス未入力
        guard let mailAddress = mailAddressTextField.text, !mailAddress.isEmpty else {
            present(alert, animated: true, completion: nil)
            return
        }
        
        // パスワード未入力
        guard let password = passWordTextField.text, !password.isEmpty else {
            present(alert, animated: true, completion: nil)
            return
        }
        
        alert.setValue("登録に失敗しました", forKey: "message")
        Auth.auth().createUser(withEmail: mailAddress, password: password){ (authResult, error) in
            guard (authResult?.user) != nil else {
                // TODO 異常系処理実装
                self.present(alert, animated: true, completion: nil)
                return
            }
            // TODO 正常系処理実装
            self.performSegue(withIdentifier: "homeView", sender: nil)
        }
    }
    
}
