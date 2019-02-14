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
    case profile
    case camera
}

class MenuViewController: UITableViewController {
    
    var didTapMenuType: ((MenuType) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuType = MenuType(rawValue: indexPath.row) else { return }
        dismiss(animated: true) { [weak self] in
            self?.didTapMenuType?(menuType)
            print("Dissmising \(menuType)")
        }
    }
}
