import Foundation

enum CategoriesFactory {
    static func make() -> CategoriesViewController {
        let presenter = CategoriesPresenter()
        let interactor = CategoriesInteractor(presenter: presenter)
        let viewController = CategoriesViewController(interactor: interactor)
        presenter.controller = viewController

        return viewController
    }
}
