//
//  ProductsListViewController.swift
//  CleanArchExample
//
//  Created by Mohamed Samy on 31/01/2024.
//

import UIKit

class ProductsListViewController: UIViewController, ProductsListViewProtocol {
    @IBOutlet weak var collectionView: UICollectionView!
    var presenter: ProductsPresenterProtocol?
    let router = Router()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        presenter?.loadProducts()
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ProductCollectionViewCell.reuseIdentifier)
    }
    
    func reloadTableview() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func navigateToProductDetails(with product: ProductUIModel) {
        router.navigateToProductDetails(product: product)
    }
}

extension ProductsListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.products.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.reuseIdentifier, for: indexPath) as? ProductCollectionViewCell else {
               fatalError("Unable to dequeue ProductCollectionViewCell")
           }
           
        guard let product = presenter?.products[indexPath.item] else { return  UICollectionViewCell() }
           cell.configure(with: product)
           
           return cell
       }
    
    // Implement the UICollectionViewDelegateFlowLayout method to adjust the size of items (cells)
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          let collectionViewWidth = collectionView.bounds.width
          let spacing: CGFloat = 12
          let cellWidth = (collectionViewWidth - spacing) / 2
          return CGSize(width: cellWidth, height: 120)
      }
      
      // Implement the UICollectionViewDelegateFlowLayout method to adjust the spacing between items (cells)
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
          return 12 // Adjust the spacing between items as needed
      }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.didSelectCell(at: indexPath.row)
    }
    
}
