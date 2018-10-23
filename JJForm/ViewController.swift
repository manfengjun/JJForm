//
//  ViewController.swift
//  JJForm
//
//  Created by ios on 2018/10/18.
//  Copyright © 2018 ios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let first = JJFormTextItem(key: "key", title: "批次号", content: "PC18090001")
        let flashGroup0 = JJFormItemGroup([
            first,
            JJFormTextItem(key: "key", title: "装车总运费", content: "2089元"),
            ])
        
        let flashGroup1 = JJFormItemGroup([
            JJFormTextItem(key: "3"),
            JJFormTextItem(key: "2")])
        let form = JJForm(content: [flashGroup0,flashGroup1])

        
        
        form.backgroundColor = UIColor.lightGray
        
        view.addSubview(form)
        form.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.left.equalTo(0)
            make.bottom.equalTo(0)
            make.right.equalTo(0)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }


}

