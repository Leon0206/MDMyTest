//
//  HomeVC.swift
//  Home
//
//  Created by zitao0206 on 2022/11/30.
//

import UIKit

class HomeVC: UIViewController {
    let cellIdentifier = "HomeContentCell"
    let numberOfCellsPerRow = 2
    let collectionViewInset: CGFloat = 5
    let cellSpacing: CGFloat = 5
    let cellHeight : CGFloat = 60
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumInteritemSpacing = cellSpacing
        flowLayout.minimumLineSpacing = cellSpacing
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HomeContentCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.contentInset = UIEdgeInsets(top: collectionViewInset, left: collectionViewInset, bottom: collectionViewInset, right: collectionViewInset)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    lazy var items: [String] = {
        var items = [String]()
        items.append("UIStackView")
        items.append("SwiftUI")
        items.append("Network")
        for i in 4...10 {
           items.append("Item \(i)")
        }
        return items
    }()
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        // 添加UICollectionView到视图中
        view.addSubview(collectionView)

        // 设置UICollectionView的约束
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        view.backgroundColor = .white
    }
}

// MARK: - UICollectionViewDataSource

extension HomeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! HomeContentCell
        cell.label.text = items[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        if indexPath.row == 0 {
            navigationController?.pushViewController(StackViewVC(), animated: true)
        } else if indexPath.row == 1 {
            navigationController?.pushViewController(SwiftUIVC(), animated: true)
        } else if indexPath.row == 2 {
            navigationController?.pushViewController(NetworkVC(), animated: true)
        } else {
            print("index:\(indexPath.row) being tapped")
        }
    }
}

// MARK: -  UICollectionViewDelegateFlowLayout

extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalSpacing = cellSpacing * CGFloat(numberOfCellsPerRow - 1) + collectionViewInset * 2
        let width = (collectionView.bounds.width - totalSpacing) / CGFloat(numberOfCellsPerRow)
        return CGSize(width: width, height: cellHeight)
    }
}

 

