//
//  PAHomeViewController.swift
//  petApp
//
//  Created by Talha Demirkan on 21.12.2023.
//

import UIKit

class PAHomeViewController: UIViewController {
    
    private let viewModel: PAHomeViewViewModel
    private let homeView: PAHomeView
    
    init(viewModel: PAHomeViewViewModel) {
        self.viewModel = viewModel
        self.homeView = PAHomeView(frame: .zero, viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(homeView)
        addConstraints()
        homeView.collectionView?.delegate = self
        homeView.collectionView?.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    
    private func addConstraints(){
        NSLayoutConstraint.activate([
            homeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            homeView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            homeView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            homeView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }

}

extension PAHomeViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionType = viewModel.sections[section]
        switch sectionType{
        case .header(let viewModels):
            return viewModels.count
        case .main:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionType = viewModel.sections[indexPath.section]
        
        switch sectionType{
        case .header(let viewModels):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PAHeaderCollectionViewCell.cellIdentifier,
                for: indexPath
            )as? PAHeaderCollectionViewCell else {
                fatalError()
            }
            cell.configure(with: viewModels[indexPath.row])
            return cell
        case .main(let viewModel):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PAMainCollectionViewCell.cellIdentifier,
                for: indexPath
            )as? PAMainCollectionViewCell else {
                fatalError()
            }
            cell.configure(with: viewModel)
            cell.backgroundColor = .systemBlue
            return cell
        }
    }
}
