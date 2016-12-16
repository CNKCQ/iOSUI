//
//  ListPresenter.swift
//  ListKit
//
//  Created by KingCQ on 2016/12/16.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

import UIKit

protocol ListPresenter {
    var indexPathsForSelectedItems: [IndexPath]? { get }
    func reloadData()
    func numberOfItems(inSection section: Int) -> Int
}

extension UICollectionView: ListPresenter {}

extension UITableView: ListPresenter {
    
    public func numberOfItems(inSection section: Int) -> Int {
        return numberOfRows(inSection: section)
    }
    
    public var indexPathsForSelectedItems: [IndexPath]? {
        return indexPathsForSelectedRows as [IndexPath]?
    }
}
