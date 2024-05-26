//
//  ViewController.swift
//  TextFieldDemo
//
//  Created by 松原涼一 on 2023/09/04.
//

import UIKit

// TextField 入力時の完了通知を受け取るためにdelegateを追加
class ViewController: UIViewController,UITextFieldDelegate{
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    
    // 検索ボタンが押された時の処理
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text else {
            label.text = "nil"
            return false
        }
        label.text = text
        
        return true
    }
    
    
    
    
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        }
        
        
    }

