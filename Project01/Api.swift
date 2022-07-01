import Foundation

final class Api {
    static func getCategories() -> [Category] {
        return Category.allCases
    }
}

enum Category: String, CaseIterable {
    case films
    case people
    case planets
    case species
    case starships
    case vehicles
}


//let baseUrl: String = "http https://swapi.dev/api/"
//
//guard let url = URL(string: baseUrl) else { return [] }
//
//URLSession.shared.dataTask(with: url) { data, response, error in
//    if data != nil {
//
//    }
//}
//return []
