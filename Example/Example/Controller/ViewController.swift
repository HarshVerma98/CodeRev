import UIKit
import CoreData
import UnsplashPhotoService


class ViewController: UIViewController {

    // MARK: - Properties
    var imageDataModel: [ImageDataModel] = []
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.delegate = self
        return table
    }()
    
    
    // MARK: - VC Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20.0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 12.0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -12.0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        tableView.backgroundColor = UIColor.white
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TopicCell")
        
        NetworkManager.shared.fetchAllTopics { dataModel in
            DispatchQueue.main.async {
                self.imageDataModel = dataModel
                self.tableView.reloadData()
            }
        }
    }
}

// MARK: - TableView Delegate Extension
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let imagesViewController = ImagesViewController()
        imagesViewController.topic = imageDataModel[indexPath.row]
        navigationController?.pushViewController(imagesViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - TableView DataSource Extension

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageDataModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopicCell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        if #available(iOS 14.0, *) {
            var content = cell.defaultContentConfiguration()
            content.text = imageDataModel[indexPath.row].title
        
            cell.contentConfiguration = content
        } else {
            // Fallback on earlier versions
            cell.backgroundColor = .white
            cell.textLabel?.text = imageDataModel[indexPath.row].title
            cell.textLabel?.textColor = .black
        }
        
        
        return cell
    }
}
