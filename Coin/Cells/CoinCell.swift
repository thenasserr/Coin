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
    coinLabel.text = coin.titleLabelText
    let imageURL = coin.coinImage
    coinImage.load(urlString: imageURL)
  }
}
