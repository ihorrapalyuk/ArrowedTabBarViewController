//
//  ArrowedTabBarViewController.swift
//
//  Created by Ihor Rapalyuk on 4/9/16.
//  Copyright © 2016 My. All rights reserved.
//

import UIKit

@IBDesignable
class ArrowedTabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    private var tabBarArrow: UIImageView?
    private var tabBarShadow: UIImageView?
    @IBInspectable var arrowImage: UIImage?
    @IBInspectable var shadowTabBarImage: UIImage?
    @IBInspectable var shadowHaight: CGFloat = 5
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.updateViews()
        self.addShadow()
        self.addTabBarArrow()
        self.delegate = self
    }
    
    private func updateViews() {
        guard let window = UIApplication.sharedApplication().delegate?.window else {
            return
        }
        
        if self.tabBarShadow == nil {
            self.tabBarShadow = UIImageView(image: self.shadowTabBarImage)
            window?.addSubview(self.tabBarShadow!)
            window?.bringSubviewToFront(tabBarShadow!)
        }
        
        if self.tabBarArrow == nil {
            self.tabBarArrow = UIImageView(image: self.arrowImage)
            window?.addSubview(self.tabBarArrow!)
            window?.bringSubviewToFront(tabBarArrow!)
        }
    }
    
    private func addShadow() {
        guard let window = UIApplication.sharedApplication().delegate?.window else {
            return
        }
        
        tabBarShadow?.contentMode = .ScaleToFill
        // To get the vertical location we start at the bottom of the window, go up by height of the tab bar, go up again by the height of arrow and then come back down 2 pixels so the arrow is slightly on top of the tab bar.
        let verticalLocation = (window?.frame.size.height ?? 0) - self.tabBar.frame.size.height - self.shadowHaight
        
        tabBarShadow?.frame = CGRectMake(0, verticalLocation, (window?.frame.width ?? 0), self.shadowHaight)
        
    }
    
    private func addTabBarArrow() {
        guard let window = UIApplication.sharedApplication().delegate?.window else {
            return
        }
    
        // To get the vertical location we start at the bottom of the window, go up by height of the tab bar, go up again by the height of arrow.
        let verticalLocation = (window?.frame.size.height ?? 0) - self.tabBar.frame.size.height - (self.arrowImage?.size.height ?? 0)
    
        tabBarArrow?.frame = CGRectMake(self.horizontalLocationFor(0), verticalLocation, (self.arrowImage?.size.width ?? 0), (self.arrowImage?.size.height ?? 0))
    
    }
    
    private func horizontalLocationFor(tabIndex: Int) -> CGFloat {
        guard let tabBarArrow = self.tabBarArrow else {
            return 0
        }
        
        // A single tab item's width is the entire width of the tab bar divided by number of items
        let tabItemWidth = self.tabBar.frame.size.width / CGFloat(self.tabBar.items?.count ?? 0)
        // A half width is tabItemWidth divided by 2 minus half the width of the arrow
        let halfTabItemWidth = (tabItemWidth / 2.0) - (tabBarArrow.frame.size.width / 2.0)
        
        // The horizontal location is the index times the width plus a half width
        return (CGFloat(tabIndex) * tabItemWidth) + halfTabItemWidth
    }
    
    //MARK: UITabBarControllerDelegate
    
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        guard let tabBarArrow = self.tabBarArrow else {
            return
        }
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0.2)
        var frame = tabBarArrow.frame
        frame.origin.x = self.horizontalLocationFor(self.selectedIndex)
        tabBarArrow.frame = frame
        UIView.commitAnimations()
    }
}
