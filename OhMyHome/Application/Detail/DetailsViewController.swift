//
//  DetailsViewController.swift
//  OhMyHome
//
//  Created by Solo on 02/04/2022.
//

import UIKit

enum DetailsRowType : Int {
    case ArtWork = 0
    case TrackName
    case Artist
    case Kind
    case Collection
    case ReleaseDate
}

class DetailsViewController: UIViewController {
    
    var presenter: DetailsPresenterImpl!

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    var tableViewBottomConstraint: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupViews()
    }
    
    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: view.safeAreaInsets.bottom, right: 0)
        
        tableViewBottomConstraint = tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        tableViewBottomConstraint?.isActive = true
        tableView.register(UINib(nibName: ArtworkCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: ArtworkCell.identifier)
        tableView.register(UINib(nibName: DetailCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: DetailCell.identifier)

    }
}


extension DetailsViewController : UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
            case DetailsRowType.ArtWork.rawValue:
                let cell = tableView.dequeueReusableCell(withIdentifier: ArtworkCell.identifier, for: indexPath) as! ArtworkCell
                presenter.configureArtWork(cell: cell)
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: DetailCell.identifier, for: indexPath) as! DetailCell
                presenter.configureDetails(cell: cell, row: indexPath.row)
                return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
            case DetailsRowType.ArtWork.rawValue:
                return 100
            default:
                return 50
        }
    }
}

extension DetailsViewController : UITableViewDelegate {
    
}

extension DetailsViewController : DetailsView {
    
}
