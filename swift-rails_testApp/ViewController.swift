//
//  ViewController.swift
//  swift-rails_testApp
//
//  Created by 木下雅大 on 2019/04/19.
//  Copyright © 2019年 miball. All rights reserved.
//

import UIKit
import Alamofire

class Memo {
    var text: String = ""
}

class StockMemos {
    
    // 保存ボタンが押されたときに呼ばれるメソッドを定義
    class func postMemo(memo: Memo) {
        
        let params: [String: AnyObject] = [
            "text": memo.text as AnyObject
        ]
        
        // HTTP通信
        // Both calls are equivalent
        Alamofire.request("http://localhost:3000/api/memos", method: .post, parameters: params)
        
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func tapSaveBtn(_ sender: Any) {
        let memo = Memo()
        memo.text = textView.text
        
        StockMemos.postMemo(memo: memo)
    }
    
}

