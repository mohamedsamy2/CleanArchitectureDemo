//
//  ProductDetailsViewController.swift
//  CleanArchExample
//
//  Created by Mohamed Samy on 12/02/2024.
//

import UIKit
import AlamofireImage

class ProductDetailsViewController: UIViewController, ProductDetailsViewControllerProtocol {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var beforeDiscountLabel: UILabel!
    @IBOutlet weak var afterDiscountLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var favoritesBtn: UIButton!
    var presenter: ProductDetailsPresenterProtocol?

    @IBAction func favButtonAction(_ sender: Any) {
        presenter?.favoriteButtonPressed()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.view = self
        setupView()
    }

    func setupView() {
        nameLabel.text = presenter?.product?.name
        beforeDiscountLabel.text = presenter?.product?.priceBeforeDiscount
        afterDiscountLabel.text = presenter?.product?.priceAfterDiscount
        favoritesBtn.setTitle(presenter?.btnTitle, for: .normal)
        productImage.af.setImage(withURL: URL(string: presenter?.product?.image ?? "")!, placeholderImage: UIImage.remove)
    }

}
