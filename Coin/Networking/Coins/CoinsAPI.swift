//
//  CoinsAPI.swift
//  Coin
//
//  Created by Ibrahim Nasser Ibrahim on 23/10/2023.
//

import Foundation

protocol CoinAPIProtocol {
    func getCoin(completion: @escaping (Result<[CoinModel]?, NSError>) -> Void )
}

class CoinAPI: BaseAPI<CoinsNetworking> {
    //MARK: - Requests

  static let shared = CoinAPI()
    func getCoin(completion: @escaping (Result<[CoinModel]?, NSError>) -> Void ) {
        self.fetchData(target: .getCoin, responseClass: [CoinModel].self) { result in
            completion(result)
        }
    }
}
