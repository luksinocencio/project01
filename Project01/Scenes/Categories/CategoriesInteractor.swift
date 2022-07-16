import Foundation

/**
Engrenagem
 Cara responsavel pelas regras de negocio
 */

protocol CategoriesInterecting {
    func loadCategories()
}

class CategoriesInteractor: CategoriesInterecting {
    let presenter: CategoriesPresenter

    init(presenter: CategoriesPresenter) {
        self.presenter = presenter
    }

    func loadCategories() {
//        let categories = Api.getCategories().filter { c in
//            c.rawValue.uppercased().prefix(1) == "F"
//        }
//        presenter.presentCategories(categories: categories)
        presenter.presentCategories(categories: Api.getCategories())
    }
}
