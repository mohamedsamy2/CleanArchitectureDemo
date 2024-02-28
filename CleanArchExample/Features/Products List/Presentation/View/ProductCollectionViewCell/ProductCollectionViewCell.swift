import UIKit
import AlamofireImage

class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    static let reuseIdentifier = "ProductCollectionViewCell"

    override func awakeFromNib() {
        self.addBorder()
    }
    func configure(with product: ProductUIModel) {
        productNameLabel.text = product.name
        productImageView.af.setImage(withURL: URL(string: product.image)!, placeholderImage: UIImage.remove)
    }
    
    private func addBorder() {
        layer.borderWidth = 1.0
          layer.borderColor = UIColor.lightGray.cgColor
          layer.cornerRadius = 8.0
          clipsToBounds = true
    }
}
