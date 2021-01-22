//
//  NewsVC.swift
//  News App
//
//  Created by Anna Sibirtseva on 22/01/2021.
//

import UIKit

class NewsVC: UICollectionViewController {
    
    var articles = [Article(headline: "this is news"),
                    Article(headline: "this is news"),
                    Article(headline: "this is news"),]

    override func viewDidLoad() {
        super.viewDidLoad()
        customizeNavBar()
    }
    
    private func customizeNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor  = .systemOrange // for small titles
        navigationController?.view.backgroundColor = .systemOrange // for large titles
    }
    
}

extension NewsVC {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArticleCell", for: indexPath) as? ArticleCell else { return UICollectionViewCell() }
        let article = articles[indexPath.item]
        cell.populate(with: article)
        return cell
    }
}
