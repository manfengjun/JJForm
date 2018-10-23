
//
//  JJFormTextItem.swift
//  JJForm
//
//  Created by ios on 2018/10/23.
//  Copyright © 2018 ios. All rights reserved.
//

import UIKit
open class JJFormTextItem: JJFormItem {
    var config: JJFormConfig = JJFormConfig.shared {
        didSet {
            titleLabel?.font = config.titleFont
            titleLabel?.textColor = config.titleColor
            contentLabel?.font = config.contentFont
            contentLabel?.textColor = config.contentColor
            titleLabel?.snp.updateConstraints({ (make) in
                make.left.equalTo(config.leftRightLoading)
            })
            contentLabel?.snp.makeConstraints({ (make) in
                make.right.equalTo(-config.leftRightLoading)
            })
        }
    }
    var title: String? {
        didSet {
            titleLabel?.text = title
        }
    }
    var titleLabel:UILabel?
    var contentLabel:UILabel?
    
    public convenience init(key: String, title: String, content: String) {
        self.init(key: key)
        self.title = title
        self.value = content
        setupSubViews()
    }
    func setupSubViews() {
        titleLabel = UILabel()
        titleLabel?.font = config.titleFont
        titleLabel?.textColor = config.titleColor

        titleLabel?.text = title
        addSubview(titleLabel!)
        titleLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(config.leftRightLoading)
            make.width.lessThanOrEqualTo(self.snp.width).multipliedBy(0.3)
            make.centerY.equalToSuperview()
        })
        
        contentLabel = UILabel()
        contentLabel?.font = config.contentFont
        contentLabel?.textColor = config.contentColor

        contentLabel?.text = value as? String
        addSubview(contentLabel!)
        contentLabel?.snp.makeConstraints({ (make) in
            make.right.equalTo(-config.leftRightLoading)
            make.width.lessThanOrEqualTo(self.snp.width).multipliedBy(0.7)
            make.centerY.equalToSuperview()
        })
    }
}
extension JJFormTextItem: JJFormItemProtocol {
    public typealias ValueType = String
    
    public var value: JJFormValue? {
        get {
            return _value as? String
        }
        set {
            _value = newValue
            contentLabel?.text = newValue as? String
        }
    }
    
    public var valueDic: [String : JJFormValue] {
        return [key: value ?? ""]
    }
}
extension String: JJFormValue{}
