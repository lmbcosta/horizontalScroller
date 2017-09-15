//
//  HorizontalScrollerView.swift
//  RWBlueLibrary
//
//  Created by Luis  Costa on 15/09/17.
//  Copyright © 2017 Razeware LLC. All rights reserved.
//

import UIKit

protocol HorizontalScrollerViewDataSource: class {
  func numberOfViews(in horizontalScrollerView: HorizontalScrollerView) -> Int
  func horizontalScrollerView(_ horizontalScrollerView: HorizontalScrollerView, viewAt index: Int) -> UIView
}

protocol HorizontalScrollerViewDelegate: class {
  func horizontalScrollerView(_ horizontalScrollerView: HorizontalScrollerView, viewAt index: Int)
}

class HorizontalScrollerView: UIView {
  
  enum Contants {
    static let Padding: CGFloat = 10
    static let Dimensions: CGFloat = 100
    static let Offset: CGFloat = 100
  }
  
  weak var dataSource: HorizontalScrollerViewDataSource?
  weak var delegate: HorizontalScrollerViewDelegate?
  
  private let scroller = UIScrollView()
  private var contentViews = [UIView]()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    initializeScrollView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    initializeScrollView()
  }
  
  func initializeScrollView() {
    addSubview(scroller)
    
    scroller.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      scroller.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      scroller.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      scroller.topAnchor.constraint(equalTo: self.topAnchor),
      scroller.bottomAnchor.constraint(equalTo: self.bottomAnchor)
      ])
    
    let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(scrollerTapped(gesture:)))
    scroller.addGestureRecognizer(tapRecognizer)
  }
  
  func scrollToView(at index: Int, animated: Bool = true) {
    let centralView = contentViews[index]
    let targetCenter = centralView.center
    scroller.setContentOffset(targetCenter, animated: animated)
  }
  
  @objc func scrollerTapped(gesture: UITapGestureRecognizer) {
    let location = gesture.location(in: scroller)
    guard
      let index = contentViews.index(where: { $0.frame.contains(location)})
      else { return }
    
    delegate?.horizontalScrollerView(self, viewAt: index)
    scrollToView(at: index)
  }
  

  
  
  
  
  
  
  
  
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
  
  

}
