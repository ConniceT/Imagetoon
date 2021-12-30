//
//  AlbumPhotoCell.swift
//  ImageToon
//
//  Created by Dayo Banjo on 12/25/21.
//


import UIKit

class AlbumPhotoCell: UICollectionViewCell {
    
    let imageView: UIImageView
    var label : UILabel!
    
    var assetIdentifier: String = "AlbumPhotoCell"
    
    override var isSelected: Bool {
        didSet {
            contentView.backgroundColor = isSelected ? UIColor(white: 1, alpha: 0.7): .clear
        }
    }
    
    override init(frame: CGRect) {
        
        imageView = UIImageView(frame: CGRect(origin: .zero, size: frame.size))
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        imageView.contentMode = .scaleAspectFill
        
        super.init(frame: frame)
        
        backgroundView = imageView
        label = generateUILabel(text: "00:00")
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = .white
        
        addSubview(label)
        label.anchor(top: nil, leading: nil, bottom: bottomAnchor, trailing: trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 5, right: 5))
        label.isHidden = true
        clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    func showLabel(with text: String){
        label.text = text
        label.isHidden = false
    }
}

