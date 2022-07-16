import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        UINavigationBar.appearance().prefersLargeTitles = true
        UINavigationBar.appearance().tintColor = UIColor.white
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.darkContent

        let controller = CategoriesFactory.make()

        window = UIWindow(windowScene:  windowScene)
        window?.rootViewController = UINavigationController(rootViewController: controller)
        window?.makeKeyAndVisible()
    }
}

