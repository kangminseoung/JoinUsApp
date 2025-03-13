//
//  SceneDelegate.swift
//  JoinUsApp
//
//  Created by 강민성 on 3/13/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        let viewController = UIViewController()
        viewController.view = SuccessView(frame: UIScreen.main.bounds) // StartView 로드
        
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
}
