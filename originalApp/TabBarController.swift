//
//  TabBarController.swift
//  originalApp
//
//  Created by 杉田優衣 on 2022/07/16.
//

import UIKit
import Firebase

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        //タブアイコンの色
        self.tabBar.tintColor = UIColor(red: 1.0, green: 0.44, blue: 0.11, alpha: 1)
        //タブバーの背景色を設定
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = UIColor(red: 0.96, green: 091, blue: 0.87, alpha: 1)
        self.tabBar.standardAppearance = appearance
        self.tabBar.scrollEdgeAppearance = appearance
        //UITabBarControllerDelegateプロトコルのメソッドをこのクラスで処理する。
        self.delegate = self
        // Do any additional setup after loading the view.
    }
    
    //タブバーのアイコンがタップされた時に呼ばれるdelegateメソッドを処理する。
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController is TimerViewController {
            //TimerViewControllerは、タブ切り替えではなくモーダル画面遷移する
            let timerViewController = storyboard!.instantiateViewController(withIdentifier: "Timer")
            present(timerViewController, animated: true)
            return false
        } else {
            //その他のViewControllerは通常のタブ切り替えを実施
            return true
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
