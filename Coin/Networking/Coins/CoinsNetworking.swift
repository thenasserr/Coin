//
//  CoinsNetworking.swift
//  Coin
//
//  Created by Ibrahim Nasser Ibrahim on 23/10/2023.
//

import Foundation
import Alamofire

enum CoinsNetworking {
    case getCoin
}

extension CoinsNetworking: TargetType {
    var baseURL: String {
        switch self {

        default:
            return "https://api.coingecko.com/api"
        }
    }

    var path: String {
        switch self {

        case .getCoin:
            return "/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&price_change_percentage=24h&locale=en"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .getCoin:
            return .get
        }
    }

    var task: Task {
        switch self {

        case .getCoin:
            return .requestPlain
        }
    }

    var headers: [String : String]? {
        return [:]
    }


}
