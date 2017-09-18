//
//  DetailsViewController.swift
//  iPhoneXSafeArea
//
//  Created by Justin Stanley on 2017-09-17.
//  Copyright © 2017 Justin Stanley. All rights reserved.
//

import Foundation
import UIKit

final class DetailsViewController: UIViewController {
    @IBOutlet private weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        label.text = ListViewControllerTableData().titles.joined(separator: "\n\n")
    }
    
    @IBAction func CloseButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
