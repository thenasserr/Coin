//
//  Displayable.swift
//  Coin
//
//  Created by Ibrahim Nasser Ibrahim on 23/10/2023.
//

import Foundation

protocol Displayable {
  var titleLabelText: String { get }
  var subtitleLabelText: String { get }
  var item1: (label: String?, value: Double?) { get }
  var item2: (label: String?, value: Int?) { get }
  var item3: (label: String?, value: Double?) { get }
  var coinImage: String { get }
}
