//
//  HomeTabBarVC.swift
//  Home
//
//  Created by lizitao on 2022/11/30.
//

import UIKit
import AKOCommonToolsKit

open class HomeTabBarVC: UITabBarController {
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewControllers()
        view.backgroundColor = UIColor.white
    }
    
    func setupViewControllers() {
        let nav1 = setupVC(HomeVC(), "首页", "tab_home", 1)
        let nav2 = setupVC(SearchVC(), "搜索", "tab_discover", 2)
        let nav3 = setupVC(SettingVC(), "设置", "tab_setting", 3)

        setViewControllers([nav1, nav2, nav3], animated: false)
        
    }

    func setupVC(_ vc: UIViewController, _ title:String, _ imageName:String, _ tag: Int) -> UINavigationController {
        vc.navigationItem.title = title
        let nav = UINavigationController(rootViewController: vc)
        nav.navigationBar.prefersLargeTitles = true
        nav.navigationItem.largeTitleDisplayMode = .automatic
        let image = UIImage.home_image_named(imageName)
        let selectedImageName = imageName + "_selected"
        let selectedImage = UIImage.home_image_named(selectedImageName)
        nav.tabBarItem = UITabBarItem(title: title, image: image, selectedImage: selectedImage)
        nav.tabBarItem.tag = tag
        return nav
    }
}
