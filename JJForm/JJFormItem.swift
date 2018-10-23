
//
//  JJFormItem.swift
//  JJForm
//
//  Created by ios on 2018/10/23.
//  Copyright © 2018 ios. All rights reserved.
//

import UIKit
public protocol JJFormValue {}
public protocol JJFormResultProtocol {
    var value: JJFormValue? { set get }
    var valueDic: [String: JJFormValue] { get }
}
public protocol JJFormItemProtocol: JJFormResultProtocol {
    associatedtype ValueType: JJFormValue
}
open class JJFormItem: UIControl {
    // top separator
    private var topSeparator: UIView?
    // bottom separator
    private var bottomSeparator: UIView?
    
    var bottomSeparatorLeftPadding: CGFloat = JJFormConfig.shared.leftRightLoading {
        didSet {
            bottomSeparator?.snp.updateConstraints({ (make) in
                make.left.equalTo(bottomSeparatorLeftPadding)
            })
        }
    }
    /// top isHidden
    var isShowTopLine: Bool = false {
        didSet {
            if let topSeparator = topSeparator {
                topSeparator.isHidden = isShowTopLine
            }
            else if isShowTopLine
            {
                createTopSeparator()
            }
        }
    }
    /// bottom isHidden
    var isShowBottomLine: Bool = true {
        didSet {
            if let bottomSeparator = bottomSeparator {
                bottomSeparator.isHidden = isShowBottomLine
            }
            else if isShowBottomLine
            {
                createBottomSeparator()
            }
        }
    }
    public var key: String!
    var _value: Any?
    
    
    
    public init(key: String) {
        self.init()
        self.key = key
        backgroundColor = UIColor.white
        setup_ui()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    func createTopSeparator() {
        let separator = UIView()
        separator.backgroundColor = .red
        addSubview(separator)
        separator.snp.makeConstraints({ (make) in
            make.left.right.top.equalTo(0)
            make.height.equalTo(JJFormConfig.SINGLE_LINE)
        })
        topSeparator = separator
    }
    func createBottomSeparator() {
        let separator = UIView()
        separator.backgroundColor = .orange
        addSubview(separator)
        separator.snp.makeConstraints({ (make) in
            make.right.bottom.equalTo(0)
            make.left.equalTo(bottomSeparatorLeftPadding)
            make.height.equalTo(JJFormConfig.SINGLE_LINE)
        })
        bottomSeparator = separator
    }
    /// SetUp UI
    func setup_ui() {
        isShowBottomLine = true
    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
