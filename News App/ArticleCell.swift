//
//  NewsCell.swift
//  News App
//
//  Created by Anna Sibirtseva on 22/01/2021.
//

import UIKit

class ArticleCell: UICollectionViewCell {
    
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var headlineLabel: UILabel!
    
    func populate(with article: Article) {
        headlineLabel.text = article.headline
    }
}
