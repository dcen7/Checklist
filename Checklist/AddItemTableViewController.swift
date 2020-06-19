//
//  AddItemTableViewController.swift
//  Checklist
//
//  Created by Mehmet Deniz Cengiz on 6/18/20.
//  Copyright © 2020 Deniz Cengiz. All rights reserved.
//

import UIKit

class AddItemTableViewController: UITableViewController {

    @IBOutlet var textField: UITextField!
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func done(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.largeTitleDisplayMode = .never
    }


  
}
