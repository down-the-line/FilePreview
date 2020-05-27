//
//  ImagePreviewView.swift
//  NoahUser
//
//  Created by Hardeep Singh on 27/04/20.
//  Copyright © 2020 Hardeep. All rights reserved.
//

import Foundation

class ImagePreviewView: UIView {
    
    var imageView: UIImageView
    private var previewItem: PreviewItem?

    func loadImage(url: URL) {
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else {
                return
            }
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self.imageView.image = image
            }
        }
    }
    
    private override init(frame: CGRect) {
        imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFill
        super.init(frame: frame)
        self.addSubview(imageView)
    }
    
    convenience init(previewItem: PreviewItem) {
        self.init(frame: .zero)
        self.previewItem = previewItem
        loadImage(url: previewItem.url)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = self.bounds
    }
    
}
