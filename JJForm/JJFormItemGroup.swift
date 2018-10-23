//
//  JJFormItemGroup.swift
//  JJForm
//
//  Created by ios on 2018/10/23.
//  Copyright © 2018 ios. All rights reserved.
//

import UIKit

open class JJFormItemGroup {

    var header: UIView?
    var footer: UIView?
    var headerLabel: UILabel?
    var footerLabel: UILabel?
    
    public var headerHeight: CGFloat?
    public var key: String?
    var items: [JJFormItem] = []
    public var headerTitle: String? {
        didSet {
            if let text = headerTitle {
                if let headerLabel = headerLabel {
                    headerLabel.text = text
                }
                else
                {
                    createHeaderLabel()
                }
            }
        }
    }
    public var footerTitle: String? {
        didSet {
            if let text = footerTitle {
                if let footerLabel = footerLabel {
                    footerLabel.text = text
                }
                else
                {
                    createFooterLabel()
                }
            }
        }
    }
    init(_ items:[JJFormItem], _ key: String? = nil) {
        self.items = items
    }
    
    
    
    func createHeaderLabel() {
        let label = UILabel()
        label.text = headerTitle
        if header == nil {
            createHeader()
        }
        header?.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.left.equalTo(JJFormConfig.shared.leftRightLoading)
            make.right.equalTo(-JJFormConfig.shared.leftRightLoading)
            make.centerY.equalToSuperview()
        }
        headerLabel = label
    }
    func createHeader() {
        header = UIView()
    }
    func createFooterLabel() {
        let label = UILabel()
        label.text = footerTitle
        if footer == nil {
            createFooter()
        }
        label.snp.makeConstraints { (make) in
            make.left.equalTo(JJFormConfig.shared.leftRightLoading)
            make.right.equalTo(-JJFormConfig.shared.leftRightLoading)
            make.centerY.equalToSuperview()
        }
        footerLabel = label
    }
    func createFooter() {
        footer = UIView()
    }

}
