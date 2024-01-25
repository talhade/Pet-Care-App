//
//  PAHomeViewViewModel.swift
//  petApp
//
//  Created by Talha Demirkan on 2.01.2024.
//

import UIKit

final class PAHomeViewViewModel{
    
    enum SectionType {
        case header(viewModels: [PAHeaderCollectionViewCellViewModel])
        case main(viewModel: PAMainCollectionViewCellViewModel)
    }
    
    public var sections: [SectionType] = []
    
    init() {
        setUpSections()
    }
    
    private func setUpSections(){
        sections = [
            .header(viewModels: [.init(), .init(), .init(), .init(), .init(), .init(),]),
            .main(viewModel: .init())
        ]
    }
    
    public func createHeaderSectionLayout() -> NSCollectionLayoutSection{
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)
            )
        )
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 10,
            leading: 5,
            bottom: 10,
            trailing: 5)
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .absolute(100),
                heightDimension: .absolute(100)
            ),
            subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    public func createMainSectionLayout() -> NSCollectionLayoutSection{
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)
            )
        )
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 0,
            bottom: 10,
            trailing: 0)
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(150)
            ),
            subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
}
