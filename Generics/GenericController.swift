//
//  GenericController.swift
//  YaBao
//
//  Created by Brian Voong on 12/26/18.
//  Copyright © 2018 Brian Voong. All rights reserved.
//

import UIKit

class GenericController<T: GenericCell<U>, U, H: UICollectionReusableView>: UICollectionViewController {
  
  var items = [U]()
  
  fileprivate let cellId = "cellId"
  fileprivate let headerId = "headerId"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.backgroundColor = .white
    
    collectionView.register(T.self, forCellWithReuseIdentifier: cellId)
    collectionView.register(H.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
  }
  
  fileprivate func setupRefreshControl() {
    let rc = UIRefreshControl()
    rc.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
    collectionView.refreshControl = rc
  }
  
  @objc func handleRefresh() {
    collectionView.refreshControl?.endRefreshing()
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! T
    cell.item = items[indexPath.row]
    return cell
  }
  
  override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
    return header
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return items.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
    view.layer.zPosition = -1
  }
  
  init(scrollDirection: UICollectionView.ScrollDirection = .vertical) {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = scrollDirection
    super.init(collectionViewLayout: layout)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError()
  }
  
}
