//
//  KingListViewController.swift
//  GameOfThrones
//
//  Created by Vinodh Swamy on 5/5/18.
//  Copyright © 2018 Vinodh Swamy. All rights reserved.
//

import UIKit

class KingsViewController: UITableViewController {

    var viewModel: KingsListDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let kingsVM = viewModel else {  return  }
        kingsVM.fetchKingsList { [weak self] (update) in
            self?.title = kingsVM.title
            self?.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //MARK: Orientations
    
    override var shouldAutorotate: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIDevice.current.userInterfaceIdiom == .pad ? .landscape : .portrait
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: nil, completion:{ (context) in
        })
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { (context) in
        })
    }
}

extension KingsViewController {
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let kingsVM = viewModel else {  return 0 }
        return kingsVM.kingCellModels.count
    }
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "kingCellIdentifier", for: indexPath) as! KingCell
        
        guard let kingsVM = viewModel else {  return cell }
        let cellModel = kingsVM.kingCellModels[indexPath.row]
        cell.cellModel = cellModel
     
        return cell
     }
}

