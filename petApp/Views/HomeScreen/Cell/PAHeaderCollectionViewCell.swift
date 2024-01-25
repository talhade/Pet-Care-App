//
//  PAHeaderCollectionViewCell.swift
//  petApp
//
//  Created by Talha Demirkan on 25.01.2024.
//

import UIKit

final class PAHeaderCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "PAHeaderCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "pawprint.circle")
        imageView.tintColor = .systemOrange
        return imageView
    }()
    
    private let name: PABodyLabel = {
        let name = PABodyLabel()
        name.text = "Animal"
        return name
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(name)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.layer.cornerRadius = 8
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with viewModel:PAHeaderCollectionViewCellViewModel){
        
    }
    
    private func setUpConstraints(){
        
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 10),
            imageView.widthAnchor.constraint(equalToConstant: 10),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
            
            name.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            name.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])

    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
//        imageView.image = nil
//        name.text = ""
    }
}
