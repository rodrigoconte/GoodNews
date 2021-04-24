//
//  ArticlesTableViewCell.swift
//  GoodNews
//
//  Created by Rodrigo Oliveira on 4/22/21.
//

import UIKit

class ArticlesTableViewCell: UITableViewCell {
    
    // MARK: - Attributes
    
    static var nibName = String(describing: ArticlesTableViewCell.self)
    
    // MARK: - Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
