import UIKit

// TODO: ViewController ações por meio de modelos de request para o interactor.

protocol CategoriesDisplaying: AnyObject {
    func displayCategories(categories: [Category])
}

class CategoriesViewController: UIViewController, CategoriesDisplaying {
    private var categoryArray: [Category] = []

    var interactor: CategoriesInterecting

    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false

        return table
    }()

    public init(interactor: CategoriesInterecting) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable) // em algum momento quem tentar usar, vai receber deprecated
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var isDarkContentBackground = false // <1>

    func statusBarEnterLightBackground() { // <2>
        isDarkContentBackground = false
        setNeedsStatusBarAppearanceUpdate()
    }

    func statusBarEnterDarkBackground() { // <3>
        isDarkContentBackground = false
        setNeedsStatusBarAppearanceUpdate() // <4>
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        if isDarkContentBackground { // <5>
            return .lightContent
        } else {
            return .darkContent
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Categories"
        view.backgroundColor = UIColor(named: "primaryColor")

        setupTableView()
        
        interactor.loadCategories()
    }

    func setupTableView() {
        view.addSubview(tableView)

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor(named: "primaryColor")

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    func displayCategories(categories: [Category]) {
        categoryArray = categories

        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

extension CategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categoryArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = categoryArray[indexPath.row].rawValue.uppercased()
        cell.backgroundColor = UIColor(named: "primaryColor")
        cell.textLabel?.textColor = UIColor(named: "secondaryColor")
        cell.selectionStyle = .none

        return cell
    }
}

