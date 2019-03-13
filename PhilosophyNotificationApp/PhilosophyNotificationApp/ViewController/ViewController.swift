//
//  ViewController.swift
//  PhilosophyNotificationApp
//
//  Created by takafumi onodera on 2018/12/22.
//  Copyright © 2018年 takafumi onodera. All rights reserved.
//

import UIKit

// 起動時表示画面
class ViewController: UIViewController {
    
    var timer:Timer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 一定時間ごとにユーザ情報を送信する
        // TODO 時間間隔は調整する
        timer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(self.sendUserInfo), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapNextViewButton(_ sender: Any) {
        // TODO 初回起動時はイントロダクション表示
    }
    
    @objc func sendUserInfo(timer: Timer) {
        // TODO ユーザ情報を送信する
        
    }
    
}

