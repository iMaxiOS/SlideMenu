//
//  MenuViewController.swift
//  SlideTransition
//
//  Created by Maxim Granchenko on 2/12/19.
//  Copyright © 2019 Maxim Granchenko. All rights reserved.
//

import UIKit

enum MenuType: Int {
    case home
    case camera
    case profile
}

class MenuViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuType = MenuType(rawValue: indexPath.row) else { return }
        dismiss(animated: true) {
            print("tap \(menuType)")
        }
    }
}
