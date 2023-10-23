//
//  CoinModel.swift
//  Coin
//
//  Created by Ibrahim Nasser Ibrahim on 23/10/2023.
//

import Foundation

struct CoinModel: Codable {
  let name: String?
  let id: String?
  let image: String?
  let currentPrice: Double?
//  let marketCap:Int
//  let totalVolume: Int

  enum CodingKeys: String, CodingKey {
    case name, id, image
    case currentPrice = "current_price"
//    case marketCap = "market_cap"
//    case totalVolume = "total_volume"
  }
}

//extension CoinModel: Displayable {
//  var titleLabelText: String {
//    name ?? ""
//  }
//
//  var subtitleLabelText: String {
//    id ?? ""
//  }
//
//  var item1: (label: String, value: Double) {
//    ("Current Price", currentPrice)
//  }
//
//  var item2: (label: String, value: Int) {
//    ("Market Cap", marketCap)
//  }
//
//  var item3: (label: String, value: Int) {
//    ("Total Volume", totalVolume)
//  }
//}
