//
//  CoinRepresenter.swift
//  Coin
//
//  Created by Ibrahim Nasser Ibrahim on 23/10/2023.
//

import Foundation

class CoinPresenter {

  //MARK: - Vars
  var arrData: [Displayable] = []
  var view: CoinView?

  //MARK: - Pagination Vars
  var coinPerPages = 10
  var limit = 10
  var paginationCoin: [Displayable] = []

  init(_ view: CoinView) {
    self.view = view
  }

  //MARK: - Public Function
  func getCoin() {
    CoinAPI.shared.getCoin { [weak self] coin in
      guard let self else { return }
      switch coin {

      case .success(let data):
        guard let data = data else { return }
        print(data)
        arrData = data
        limit = arrData.count
        for i in 0..<10 {
          paginationCoin.append(arrData[i] as! CoinModel)
        }
        DispatchQueue.main.async {
          self.view?.reloadCoinTableView()
        }
      case .failure(_):
        print("error")
      }
    }
  }

  func returnCoinCount() -> Int {
    return paginationCoin.count
  }

  func getUsedCoin(at row: Int) -> CoinModel {
    return paginationCoin[row] as! CoinModel
  }

  func willDisplayCoin(at row: Int) {
    if row == paginationCoin.count - 1 {
      addNewRepository()
    }

  }
}

//MARK: - Private Function
extension CoinPresenter {
  private func addNewRepository() {
    if coinPerPages >= limit {
      return
    }
    else if coinPerPages >= limit - 10 {
      for i in coinPerPages..<limit {
        paginationCoin.append(arrData[i])
      }
      self.coinPerPages += 10
    }
    else {
      for i in coinPerPages..<coinPerPages + 10 {
        paginationCoin.append(arrData[i])
      }
      self.coinPerPages += 10
    }
    DispatchQueue.main.async { [weak self] in
      self?.view?.reloadCoinTableView()
    }
  }
}
