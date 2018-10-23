//
//  JJFormConfig.swift
//  JJForm
//
//  Created by ios on 2018/10/23.
//  Copyright © 2018 ios. All rights reserved.
//

import UIKit

open class JJFormConfig {
    static let shared: JJFormConfig = JJFormConfig()
    private init() { }
    static let SINGLE_LINE:CGFloat = 1 / UIScreen.main.scale
    /// height
    var normalHeight: CGFloat = 48 + JJFormConfig.SINGLE_LINE
    /// header height
    var headerHeight: CGFloat = 10
    /// footer height
    var footerHeight: CGFloat = 10
    /// title font
    var titleFont: UIFont = UIFont.systemFont(ofSize: 16)
    /// title color
    var titleColor: UIColor = UIColor.black
    /// content font
    var contentFont: UIFont = UIFont.systemFont(ofSize: 16)
    /// content color
    var contentColor: UIColor = UIColor.black
    /// separator color
    var separatorColor: UIColor = UIColor.gray
    /// left right loading
    var leftRightLoading: CGFloat = 10
    /// separator left loading
    var separatorLeftLoading: CGFloat = 10
    /// arrow right loading
    var arrowRightLoading: CGFloat = 10
    /// arrow
    var arrow_icon: UIImage = UIImage()
    
//    /** 下面为链式配置 */
//    @discardableResult
//    public func jj_normalHeight(_ normalHeight: CGFloat) -> JJFormConfig {
//        self.normalHeight = normalHeight
//        return self
//    }
//    
//    @discardableResult
//    public func jj_headerHeight(_ headerHeight: CGFloat) -> JJFormConfig {
//        self.headerHeight = headerHeight
//        return self
//    }
//    
//    @discardableResult
//    public func jj_footerHeight(_ footerHeight: CGFloat) -> JJFormConfig {
//        self.footerHeight = footerHeight
//        return self
//    }
//    
//    @discardableResult
//    public func jj_titleFont(_ titleFont: UIFont) -> JJFormConfig {
//        self.titleFont = titleFont
//        return self
//    }
//    
//    @discardableResult
//    public func jj_titleColor(_ titleColor: UIColor) -> JJFormConfig {
//        self.titleColor = titleColor
//        return self
//    }
//    
//    @discardableResult
//    public func jj_contentFont(_ contentFont: UIFont) -> JJFormConfig {
//        self.contentFont = contentFont
//        return self
//    }
//    
//    @discardableResult
//    public func jj_contentColor(_ contentColor: UIColor) -> JJFormConfig {
//        self.contentColor = contentColor
//        return self
//    }
//    
//    @discardableResult
//    public func jj_separatorColor(_ separatorColor: UIColor) -> JJFormConfig {
//        self.separatorColor = separatorColor
//        return self
//    }
//    
//    @discardableResult
//    public func jj_leftRightLoading(_ leftRightLoading: CGFloat) -> JJFormConfig {
//        self.leftRightLoading = leftRightLoading
//        return self
//    }
//    
//    @discardableResult
//    public func jj_separatorLeftLoading(_ separatorLeftLoading: CGFloat) -> JJFormConfig {
//        self.separatorLeftLoading = separatorLeftLoading
//        return self
//    }
//    
//    @discardableResult
//    public func jj_arrowRightLoading(_ arrowRightLoading: CGFloat) -> JJFormConfig {
//        self.arrowRightLoading = arrowRightLoading
//        return self
//    }
//    
//    @discardableResult
//    public func jj_arrow_icon(_ arrow_icon: UIImage) -> JJFormConfig {
//        self.arrow_icon = arrow_icon
//        return self
//    }
}
