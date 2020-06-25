//
//  ChecklistItem.swift
//  Checklist
//
//  Created by Mehmet Deniz Cengiz on 6/12/20.
//  Copyright © 2020 Deniz Cengiz. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject {
  
  var text = ""
  var checked = false
  
  func toggleChecked() {
    checked = !checked
  }
  

}
