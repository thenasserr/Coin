//
//  CoinCell.swift
//  Coin
//
//  Created by Ibrahim Nasser Ibrahim on 23/10/2023.
//

import UIKit

class CoinCell: UITableViewCell {

  @IBOutlet weak var coinImage: UIImageView!
  @IBOutlet weak var coinLabel: UILabel!

  func configureCell(with coin: CoinModel) {
    coinLabel.text = coin.name
    guard let imageURL = coin.image else { return }
    coinImage.load(urlString: imageURL)
  }
}
