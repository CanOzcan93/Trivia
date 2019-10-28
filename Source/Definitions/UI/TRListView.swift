//
//  TRListView.swift
//  Trivia
//
//  Created by Can Özcan on 28.10.2019.
//  Copyright © 2019 CanOzcan. All rights reserved.
//

import UIKit

open class TRListView<ListItemType: TRListItemView>: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    // Internal Fields
    
    private var set: [NSLayoutConstraint]!
    
    
    // Virtuals
    
    open func onInit() {}
    open func onInjection() {}
    open func onConstruct() {}
    open func onConstrain() {}
    open func emptyMessage() -> String { return "" }
    open func needSeparator() -> Bool { return false }
    
    public var onDraw: ActionWith<CGRect>!
    
    
    // Required Fields
    
    public var items: [ListItemType]!
    
    
    // init
    
    public init(items: [ListItemType]) {
        
        self.items = items
        
        super.init(frame: .zero, style: .plain)
        
        self.delegate = self
        self.dataSource = self
        self.separatorStyle = .none
        self.rowHeight = UITableView.automaticDimension
        self.register(ListItemType.self, forCellReuseIdentifier: ListItemType.dequeueItemName)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        onInit()
        onInjection()
        onConstruct()
        onConstrain()
        
    }
    public required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    
    // Update Table View
    
    open func addItems(_ items: [ListItemType]) {
        for item in items {
            self.items.append(item)
        }
        self.reloadData()
    }
    
    open func reset() {
        self.items = [ListItemType]()
        
        self.reloadData()
    }
    
    
    // Draw Implementation
    
    open override func draw(_ rect: CGRect) {
        super.draw(rect)
        onDraw?(rect)
    }
    
    
    // TableView Implementation
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if items.count == 0 {
            self.setEmptyMessage(emptyMessage())
        }
        else {
            self.restore(separatorNeeded: self.needSeparator())
        }
        return items.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return items[indexPath.row]
    }
    
}
