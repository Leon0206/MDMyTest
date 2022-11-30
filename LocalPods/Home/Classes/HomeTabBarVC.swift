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
    }
    
    func setupViewControllers() {
        
        let vc1 = HomeVC()
        vc1.navigationItem.title = "首页"
        let nav1 = UINavigationController(rootViewController: vc1)
        nav1.navigationBar.prefersLargeTitles = true
        nav1.navigationItem.largeTitleDisplayMode = .always
        let image1 = UIImage.home_image_named("tab_home")
        let selectedImage1 = UIImage.home_image_named("tab_home_selected")
        nav1.tabBarItem = UITabBarItem(title: "首页", image: image1, selectedImage: selectedImage1)
        nav1.tabBarItem.tag = 1
        
        let vc2 = SearchVC()
        vc2.navigationItem.title = "搜索页"
        let nav2 = UINavigationController(rootViewController: vc2)
        nav2.navigationBar.prefersLargeTitles = true
        nav2.navigationItem.largeTitleDisplayMode = .always
        let image2 = UIImage.home_image_named("tab_discover")
        let selectedImage2 = UIImage.home_image_named("tab_discover_selected")
        nav2.tabBarItem = UITabBarItem(title: "搜索", image: image2, selectedImage: selectedImage2)
        nav1.tabBarItem.tag = 2

        let vc3 = SettingVC()
        vc3.navigationItem.title = "设置页"
        let nav3 = UINavigationController(rootViewController: vc3)
        nav3.navigationBar.prefersLargeTitles = true
        nav3.navigationItem.largeTitleDisplayMode = .always
        let image3 = UIImage.home_image_named("tab_setting")
        let selectedImage3 = UIImage.home_image_named("tab_setting_selected")
        nav3.tabBarItem = UITabBarItem(title: "设置", image: image3, selectedImage: selectedImage3)
        nav3.tabBarItem.tag = 3

        setViewControllers([nav1, nav2, nav3], animated: false)
   
    }
}
