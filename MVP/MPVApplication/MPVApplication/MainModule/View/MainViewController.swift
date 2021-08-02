//
//  MainViewController.swift
//  MPVApplication
//
//  Created by Дмитрий Юдин on 30.07.2021.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var postsTableView: UITableView!
    
    var presenter: MainViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "API Caller"
        postsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

// MARK: - Protocol
extension MainViewController: MainViewProtocol {
    func success() {
        self.postsTableView.reloadData()
    }
    
    func failure() {
        let alert = UIAlertController(title: "Ooops..", message: "Network Error", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Oke", style: .default))
        self.present(alert, animated: true)
    }
}

// MARK: - TableVeiwDataSource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.posts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = presenter.posts?[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = post?.body
        return cell
    }
}

// MARK: - TableViewDelegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = presenter.posts?[indexPath.row]
        presenter.tapOnTheCell(post: post)
    }
}
