//
//  SwipableCards.swift
//  Tinder
//
//  Created by Андрей Коноплев on 12.12.17.
//  Copyright © 2017 Андрей Коноплев. All rights reserved.
//

import UIKit

enum swipeDirections: Int {
    case left
    case right
}
protocol SwipableCardViewDataSource: class {
    func view (view: UIView, atIndex index: Int)
    func numberOfView()-> Int
}

protocol SwipeCardViewDelegate: class {
    func swiped (direction: swipeDirections, index: Int)
}

//MARK: -  initial interface
class SwipableCardView: UIView {
    private var nib: UINib?
    var visiableViews = NSArray()
    var visiableIndex = 0
    
    weak var dataSource: SwipableCardViewDataSource? {
        didSet{
            setUp()
        }
    }
    weak var delegate: SwipeCardViewDelegate?
    
    func registerNib(nib: UINib) {
        self.nib = nib
    }
    
    private func setUp() {
        clipsToBounds = false
        
        if nib == nil {
            print("Error: nib is nil")
            return
        }
        drawViews()
    }
    
    func reloadData() {
        
    }
    
    private func drawViews() {
        if dataSource?.numberOfView() == 0 {
            return
        }
        
        let viewsNumber = dataSource!.numberOfView() <= 3 ? 3 : dataSource?.numberOfView()
        renderViews(number: viewsNumber!)
    }
    
    private func renderViews(number: Int) {
        let viewsArray = NSMutableArray()
        var indexCounter = number - 1
        for _ in 0..<number {
            let rawView = nib?.instantiate(withOwner: nil, options: nil)[0] as! UIView
            dataSource!.view(view: rawView, atIndex: indexCounter)
            rawView.frame = bounds
            addSubview(rawView)
            viewsArray.add(rawView)
            indexCounter -= 1
        }
        visiableViews = viewsArray
        addRecognaizer()
    }
    
    private func addRecognaizer() {
        for i in 0..<visiableViews.count {
            let view = visiableViews[i] as! UIView
            addPanGesturerecognaizer(view: view)
        }
    }
    
    private func addPanGesturerecognaizer (view: UIView) {
        let recognaizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan(rec:)))
        view.addGestureRecognizer(recognaizer)
    }
}

//MARK: -  selectors gesture recognaize
extension SwipableCardView {
    @objc func handlePan(rec: UIPanGestureRecognizer) {
        let view = rec.view!
        let translation = rec.translation(in: self)
        
        let centerDiff = view.center.x - self.bounds.width / 2
        
        // center movement
        let newCenter = CGPoint(x: self.bounds.width / 2 + translation.x, y: self.bounds.height / 2 + translation.y)
        view.center = newCenter
        
        // вращение
        let rotator = self.bounds.width / 2 / 0.3
        
        view.transform = CGAffineTransform(rotationAngle: centerDiff / rotator)
        if rec.state == .ended {
            if fabs(centerDiff) >= view.frame.size.width / 2 && centerDiff > 0 {
                //доводчик в лево
                UIView.animate(withDuration: 0.1, animations: {
                    view.center = CGPoint(x: view.center.x + 500, y: view.center.y)
                }, completion: { [weak self] (finished) in
                    self?.handleAction(view: view, direction: .right)
                })
            } else if fabs(centerDiff) >= view.frame.size.width / 2 && centerDiff < 0 {
                UIView.animate(withDuration: 0.1, animations: {
                    view.center = CGPoint(x: view.center.x - 500, y: view.center.y)
                }, completion: { [weak self] (finished) in
                    self?.handleAction(view: view, direction: .left)
                })
            } else {
                //доводчик в центр
                UIView.animate(withDuration: 0.2, animations: { [weak self] in
                    if self != nil {
                        view.center = CGPoint(x: self!.bounds.size.width / 2, y: self!.bounds.size.height / 2)
                    }
                    view.transform = .identity
                })
                
            }
        }
        
    }
    
    private func handleAction(view: UIView, direction: swipeDirections) {
        delegate?.swiped(direction: direction, index: visiableIndex)
        view.removeFromSuperview()
        
        if dataSource!.numberOfView() - visiableIndex <= 3 {
            return
        }
        
        dataSource?.view(view: view, atIndex: visiableIndex + 3)
        self.transform = CGAffineTransform.identity
        //self.frame = bounds
        self.insertSubview(view, at: 0)
        visiableIndex += 1
    }
}
