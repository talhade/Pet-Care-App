//
//  PAMainCollectionViewCell.swift
//  petApp
//
//  Created by Talha Demirkan on 25.01.2024.
//

import UIKit

final class PAMainCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "PAMainCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with viewModel:PAMainCollectionViewCellViewModel){
        
    }
    
    private func setUpConstraints(){
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
