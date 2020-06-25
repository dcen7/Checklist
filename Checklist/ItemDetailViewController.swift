//
//  AddItemTableViewController.swift
//  Checklist
//
//  Created by Mehmet Deniz Cengiz on 6/18/20.
//  Copyright © 2020 Deniz Cengiz. All rights reserved.
//

import UIKit

protocol ItemDetailViewControllerDelegate: class  {
    func itemdetailviewcontrollerDidCancel(_ controller: ItemDetailViewController)
    func itemdetailviewcontroller(_ controller: ItemDetailViewController, didFinishAdding item: ChecklistItem)
    func itemdetailviewcontroller(_ controller: ItemDetailViewController, didFinishEditing item: ChecklistItem)
}

class ItemDetailViewController: UITableViewController {
    
    weak var delegate: ItemDetailViewControllerDelegate?
    weak var todoList: TodoList?
    weak var itemToEdit: ChecklistItem?

    @IBOutlet weak var addBarButton: UIBarButtonItem!
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    
    @IBOutlet var textField: UITextField!
    
    @IBAction func cancel(_ sender: Any) {
        
        delegate?.itemdetailviewcontrollerDidCancel(self)
    }
    
    @IBAction func done(_ sender: Any) {
        if let item = itemToEdit, let text = textField.text {
            item.text = text
            delegate?.itemdetailviewcontroller(self, didFinishAdding: item)
        } else {
            if let item = todoList?.newTodo() {
                if let textFieldText = textField.text {
                    item.text = textFieldText
                }
                item.checked = false
                delegate?.itemdetailviewcontroller(self, didFinishAdding: item)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let item = itemToEdit {
            title = "Edit Item"
            textField.text = item.text
            addBarButton.isEnabled = true
        }
        navigationItem.largeTitleDisplayMode = .never
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //keyboard shows up
        textField.becomeFirstResponder()
    }

    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
  
}

extension ItemDetailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let oldText = textField.text,
            let stringRange = Range(range, in: oldText) else {
                return false
        }
        
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        if newText.isEmpty {
            addBarButton.isEnabled = false
        } else {
            addBarButton.isEnabled = true
        }
        return true
    }
}
