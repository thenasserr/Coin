//
//  DetailViewController.swift
//  Coin
//
//  Created by Ibrahim Nasser Ibrahim on 23/10/2023.
//

import UIKit

class DetailViewController: UIViewController {

  //MARK: - Vars
  var data: Displayable?
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var subtitleLabel: UILabel!
  @IBOutlet weak var item1TitleLabel: UILabel!
  @IBOutlet weak var item1Label: UILabel!
  @IBOutlet weak var item2TitleLabel: UILabel!
  @IBOutlet weak var item2Label: UILabel!
  @IBOutlet weak var item3TitleLabel: UILabel!
  @IBOutlet weak var item3Label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

      setup()

    }

  func setup() {
    guard let data = data else { return }
    titleLabel.text = data.titleLabelText
    subtitleLabel.text = data.subtitleLabelText
    item1TitleLabel.text = data.item1.label
    item1Label.text = String(describing: data.item1.value)
    item2TitleLabel.text = data.item2.label
    item2Label.text = String(describing: data.item2.value)
    item3TitleLabel.text = data.item3.label
    item3Label.text = String(describing: data.item3.value)
  }
}
