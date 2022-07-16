import Foundation

// TODO: ViewModel

/**
Formata os dados
*/

protocol CategoriesPresenting {
    func presentCategories(categories: [Category])
}

class CategoriesPresenter: CategoriesPresenting {

    weak var controller: CategoriesDisplaying?

    init() { }

    func presentCategories(categories: [Category]) {
        controller?.displayCategories(categories: categories)
    }
}
