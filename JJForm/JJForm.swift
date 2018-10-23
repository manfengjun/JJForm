//
//  JJBaseForm.swift
//  JJForm
//
//  Created by ios on 2018/10/22.
//  Copyright © 2018 ios. All rights reserved.
//

import UIKit
import SnapKit
public class JJForm<Element>: UIControl {
    fileprivate var scrollView: UIScrollView = UIScrollView()
    var contentView: UIView = UIView()
    fileprivate var _rowHeight: CGFloat = JJFormConfig.shared.normalHeight
    fileprivate var _headerHeight: CGFloat = JJFormConfig.shared.headerHeight
    
    fileprivate var itemMap: [String: JJFormItem] = [:]
    var content: [Element]!
    
    fileprivate override init(frame: CGRect) {
        super.init(frame: frame)
    }
    internal required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// SetUp UI
    func setup_ui() {
        if #available(iOS 11.0, *) {
            scrollView.contentInsetAdjustmentBehavior = .never
        }
        addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalTo(0)
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { (make) in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
        }
        
    }
    
}
public extension JJForm where Element == JJFormItem {
    var rowHeight: CGFloat {
        get {
            return _rowHeight
        }
        set {
            _rowHeight = newValue
            layoutContent()
        }
    }
    
    public convenience init(content:[Element], frame: CGRect = .zero) {
        self.init(frame: frame)
        self.content = content
        setup_ui()
        setupContent()
    }
    
    func setupContent() {
        content.forEach { (item) in
            itemMap[item.key] = item
            contentView.addSubview(item)
        }
        layoutContent()
    }
    
    func layoutContent() {
        var temp: UIView?
        content.forEach { (item) in
            item.snp.makeConstraints({ (make) in
                make.left.right.equalTo(0)
                make.height.equalTo(_rowHeight)
            })
            // first
            if item == content.first {
                item.isShowTopLine = true
                item.snp.makeConstraints({ (make) in
                    make.top.equalTo(0)
                })
            }
            else
            {
                // not first
                item.snp.makeConstraints({ (make) in
                    make.top.equalTo(temp!.snp.bottom)
                })
            }
            // last
            if item == content.last {
                item.bottomSeparatorLeftPadding = 0
                item.snp.makeConstraints({ (make) in
                    make.bottom.equalTo(contentView.snp.bottom)
                })
            }
            
            temp = item
        }
    }
    
    public func valueDic() -> [String: JJFormValue] {
        var dic: [String: JJFormValue] = [:]
        itemMap.values.forEach { (item) in
            if let item = item as? JJFormResultProtocol {
                item.valueDic.forEach{dic.updateValue($1, forKey: $0)}
            }
        }
        return dic
    }
}

public extension JJForm where Element == JJFormItemGroup {
    var rowHeight: CGFloat {
        get {
            return _rowHeight
        }
        set {
            _rowHeight = newValue
            layoutContent()
        }
    }
    var headerHeight: CGFloat {
        get {
            return _headerHeight
        }
        set {
            _headerHeight = newValue
            layoutContent()
        }
    }
    convenience init(content:[Element], frame: CGRect = .zero) {
        self.init(frame: frame)
        self.content = content
        setup_ui()
        setupContent()
    }
    
    func setupContent() {
        content.forEach { (group) in
            group.items.forEach({ (item) in
                itemMap[item.key] = item
                contentView.addSubview(item)
            })
        }
        
        layoutContent()
    }
    
    func layoutContent() {
        var temp: UIView?
        content.forEach { (group) in
            group.items.forEach({ (item) in
                item.snp.makeConstraints({ (make) in
                    make.left.right.equalTo(0)
                    make.height.equalTo(_rowHeight)
                })
                // item first
                if item == group.items.first {
                    item.isShowTopLine = true
                    if let header = group.header {
                        contentView.addSubview(header)
                        header.snp.makeConstraints({ (make) in
                            make.left.right.equalToSuperview()
                            make.height.equalTo(_headerHeight)
                        })
                        if group === content.first {
                            header.snp.makeConstraints({ (make) in
                                make.top.equalTo(0)
                            })
                            item.snp.makeConstraints({ (make) in
                                make.top.equalTo(header.snp.bottom)
                            })
                        }
                        else
                        {
                            header.snp.makeConstraints({ (make) in
                                make.top.equalTo(temp!.snp.bottom)
                            })
                            item.snp.makeConstraints({ (make) in
                                make.top.equalTo(header.snp.bottom)
                            })
                        }
                    }
                    else
                    {
                        // not first
                        if group === content.first {
                            // group first
                            item.snp.makeConstraints({ (make) in
                                make.top.equalTo(group.headerHeight ?? _headerHeight)
                            })
                        }
                        else{
                            // not group fist
                            item.snp.makeConstraints({ (make) in
                                make.top.equalTo(temp!.snp.bottom).offset(group.headerHeight ?? _headerHeight)
                            })
                        }
                        
                    }
                }
                else
                {
                    item.snp.makeConstraints({ (make) in
                        make.top.equalTo(temp!.snp.bottom)
                    })
                }
                if item == group.items.last {
                    item.bottomSeparatorLeftPadding = 0
                    if let footer = group.footer {
                        contentView.addSubview(footer)
                        footer.snp.makeConstraints({ (make) in
                            make.left.right.equalTo(0)
                            make.top.equalTo(item.snp.bottom)
                        })
                        if group === content.last {
                            footer.snp.makeConstraints({ (make) in
                                make.bottom.equalTo(0)
                            })
                        }
                        temp = footer
                    }
                    else
                    {
                        if group === content.last {
                            item.snp.makeConstraints({ (make) in
                                make.bottom.equalTo(0)
                            })
                        }
                        temp = item
                    }
                }
                else
                {
                    
                    temp = item
                }
            })
        }
        
    }
    
    public func valueDic() -> [String: JJFormValue] {
        var dic: [String: JJFormValue] = [:]
        itemMap.values.forEach { (item) in
            if let item = item as? JJFormResultProtocol {
                item.valueDic.forEach{dic.updateValue($1, forKey: $0)}
            }
        }
        return dic
    }
}
