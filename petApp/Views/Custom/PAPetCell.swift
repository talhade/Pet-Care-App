//
//  PAPetCell.swift
//  petApp
//
//  Created by Talha Demirkan on 5.01.2024.
//

import UIKit

class PAPetCell: UICollectionViewCell {
    static let reuseID = "PetCell"
    
    let petImage = UIImageView(image: UIImage(named: "pawprint.circle"))
    let petName = PABodyLabel(textAlignment: .center)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(){
        addSubview(petImage)
        addSubview(petName)
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            petImage.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
            petImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            petImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            petImage.heightAnchor.constraint(equalTo: petImage.widthAnchor),
        ])
    }
}
