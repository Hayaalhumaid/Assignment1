//
//  CollectionViewCell.swift
//  Assignment1
//
//  Created by Bowei Tian on 9/15/19.
//  Copyright © 2019 HayaAlhumaid. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageTitle: UILabel!
    
    func loadMovieData(movie: Movie) {
        self.imageTitle.text = movie.title
        let link = "https://image.tmdb.org/t/p/w500" + movie.poster_path
        self.downloadFrom(link: link)
    }
    
    func downloadFrom(link:String?) {
        if link != nil, let url = URL(string: link!) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else {
                    print("error on download \(error!)")
                    return
                }
                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                    print("statusCode != 200; \(httpResponse.statusCode)")
                    return
                }
                DispatchQueue.main.async {
                    print("\ndownload completed \(url.lastPathComponent)")
                    self.imageView?.image = UIImage(data: data)
                }
                }.resume()
        } else {
            self.imageView?.image = UIImage(named: "PlaceHolderImage")
        }
    }
    
}
