//
//  PAHomeView.swift
//  petApp
//
//  Created by Talha Demirkan on 2.01.2024.
//

import UIKit

final class PAHomeView: UIView {
    
    public var collectionView: UICollectionView?
    
    private let viewModel: PAHomeViewViewModel
    
    init(frame: CGRect, viewModel: PAHomeViewViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
        let collectionView = createCollectionView()
        self.collectionView = collectionView
        addSubview(collectionView)
        addConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        guard let collectionView = collectionView else { return }
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    private func createCollectionView() -> UICollectionView {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
            return self.createSection(for: sectionIndex)
        }
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PAHeaderCollectionViewCell.self,
                                forCellWithReuseIdentifier: PAHeaderCollectionViewCell.cellIdentifier)
        collectionView.register(PAMainCollectionViewCell.self,
                                forCellWithReuseIdentifier: PAMainCollectionViewCell.cellIdentifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }
    
    private func createSection(for sectionIndex:Int) -> NSCollectionLayoutSection {
        
        let sectionTypes = viewModel.sections
        
        switch sectionTypes[sectionIndex]{
        case .header:
            return viewModel.createHeaderSectionLayout()
        case .main:
            return viewModel.createMainSectionLayout()
        
        }
    }
    
    
}
