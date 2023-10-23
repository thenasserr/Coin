//
//  CoinMainViewController.swift
//  Coin
//
//  Created by Ibrahim Nasser Ibrahim on 23/10/2023.
//

import UIKit

protocol CoinView: AnyObject {
  func reloadCoinTableView()
}

class CoinMainViewController: UIViewController {

//MARK: - Vars
  private var presenter: CoinPresenter!
  @IBOutlet weak var coinTableView: UITableView!
  override func viewDidLoad() {
        super.viewDidLoad()
    self.title = "Coins"
    presenter = CoinPresenter(self)
    presenter.getCoin()
    configureTableView()
    }

  //MARK: - Configure TableView Cell
  private func configureTableView() {
    coinTableView.dataSource = self
    coinTableView.delegate = self
    coinTableView.register(UINib(nibName: "CoinCell", bundle: nil), forCellReuseIdentifier: String(describing: CoinCell.self))
  }




}

//MARK: - TableView DataSource & Delegate
extension CoinMainViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return presenter.returnCoinCount()
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = coinTableView.dequeueReusableCell(withIdentifier: String(describing: CoinCell.self), for: indexPath) as? CoinCell else {return UITableViewCell()}
    cell.configureCell(with: presenter.getUsedCoin(at: indexPath.row))
    return cell
  }

  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    presenter.willDisplayCoin(at: indexPath.row)
  }


}

//MARK: - Coin View
extension CoinMainViewController: CoinView {
  func reloadCoinTableView() {
    DispatchQueue.main.async { [weak self] in
      self?.coinTableView.reloadData()
    }
  }
}
