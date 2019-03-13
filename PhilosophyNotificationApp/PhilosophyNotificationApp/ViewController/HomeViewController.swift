//
//  HomeViewController.swift
//  PhilosophyNotificationApp
//
//  Created by takafumi onodera on 2019/01/17.
//  Copyright © 2019年 takafumi onodera. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var userInfoButton: UIButton!
    @IBOutlet weak var userListTableView: UITableView!
    @IBOutlet weak var updateButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var loginStatusLabel: UILabel!
    @IBOutlet weak var newUserRegisterButton: UIButton!
    
    // TODO ログイン状態はfirebaseの機能を使用する
    var isLogin = false
    var handle:AuthStateDidChangeListenerHandle?

    override func viewDidLoad() {
        super.viewDidLoad()
        userListTableView.tableFooterView = UIView(frame: .zero)
        update()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // 認証状態が変わった時に受け取ることが出来る
        handle = Auth.auth().addStateDidChangeListener{(auth, user) in
            // ログイン状態の制御
            guard user != nil else {
                self.isLogin = false
                self.update()
                return
            }
            
            self.isLogin = true
            self.update()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func tapLogoutButton(_ sender: Any) {
        // ログアウト
        let alert: UIAlertController = UIAlertController(title: "", message: "ログアウトしました", preferredStyle:  UIAlertControllerStyle.alert)
        let okButtonAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{ (action: UIAlertAction!) in
            self.update()
        })
        alert.addAction(okButtonAction)
        
        // TODO ログアウト失敗時の処理を追加
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func tapUpdateButton(_ sender: Any) {
        // TODO サーバ側からユーザ情報取得、更新
        update()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO サーバからユーザ情報取得
        // TODO サーバから取得したユーザ数を指定するよう修正
        guard isLogin else {
            return 0
        }
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TODO サーバからユーザ情報取得
        // TODO サーバから取得したユーザ情報を指定するよう修正
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "user" + String(indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO タップ時に該当するユーザ情報を表示
        let message = "user" + String(indexPath.row) + "をタップしました"
        let alert: UIAlertController = UIAlertController(title: "", message: message, preferredStyle:  UIAlertControllerStyle.alert)
        let okButtonAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
            (action: UIAlertAction!) -> Void in
        })
        alert.addAction(okButtonAction)
        present(alert, animated: true, completion: nil)
    }
    
    func update() {
        if isLogin {
            loginButton.isHidden = true
            userInfoButton.isHidden = false
            updateButton.isHidden = true
            logoutButton.isHidden = false
            newUserRegisterButton.isHidden = true
            loginStatusLabel.text = "同じタグを持つ付近のユーザが表示されます"
            return
        }
        loginButton.isHidden = false
        userInfoButton.isHidden = true
        updateButton.isHidden = false
        logoutButton.isHidden = true
        newUserRegisterButton.isHidden = false
        loginStatusLabel.text = "付近のユーザを調べるにはログインして下さい"
    }
    
}
