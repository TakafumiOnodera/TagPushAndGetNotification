//
//  UserInfoViewController.swift
//  PhilosophyNotificationApp
//
//  Created by takafumi onodera on 2019/01/17.
//  Copyright © 2019年 takafumi onodera. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tagLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func update() {
        // TODO FireBaseからユーザが設定したタグ情報を取得する
        titleLabel.text = ""
        tagLabel.text = "タグが登録されていません。"
    }
    
}
