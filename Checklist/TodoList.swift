//
//  TodoList.swift
//  Checklist
//
//  Created by Mehmet Deniz Cengiz on 6/14/20.
//  Copyright © 2020 Deniz Cengiz. All rights reserved.
//

import Foundation

class TodoList {
  
  var todos: [ChecklistItem] = []
  
  init() {
    
    let row0Item = ChecklistItem()
    let row1Item = ChecklistItem()
    let row2Item = ChecklistItem()
    let row3Item = ChecklistItem()
    let row4Item = ChecklistItem()
    
    row0Item.text = "Take a jog"
    row1Item.text = "Watch a movie"
    row2Item.text = "Code an app"
    row3Item.text = "Walk the dog"
    row4Item.text = "Study design patterns"
    
    todos.append(row0Item)
    todos.append(row1Item)
    todos.append(row2Item)
    todos.append(row3Item)
    todos.append(row4Item)
    
  }
    
    func newTodo() -> ChecklistItem {
        let item = ChecklistItem()
        item.text = randomTitle()
        item.checked = false
        todos.append(item)
        
        return item
    }
    
    func randomTitle() -> String {
        let titles = ["New todo item", "Generic todo", "Fill me out", "I need something to do", "Much todo about nothing"]
        let random = Int.random(in: 0...titles.count-1)
        return titles[random]
    }
  
}
