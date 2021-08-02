//
//  DetailView.swift
//  MPVApplication
//
//  Created by Дмитрий Юдин on 02.08.2021.
//

import UIKit

class DetailView: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    var presenter: DetailViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setComment()
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        presenter.pop()
    }
}

// MARK: - Protocol
extension DetailView: DetailViewProtocol {
    func setPost(post: Post?) {
        titleLabel.text = post?.title
        bodyLabel.text = post?.body
    }
}
