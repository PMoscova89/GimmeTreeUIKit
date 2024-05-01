//
//  BinaryTreeView.swift
//  GimmeTree
//
//  Created by Patrick Moscova on 5/1/24.
//

import Foundation
import UIKit

class BinaryTreeView<T: Comparable>: UIView {
    var viewModel : BinaryTreeViewModel<T>? = nil
    
    init(frame: CGRect, viewModel: BinaryTreeViewModel<T>, backgroundColor: UIColor = .white) {
        super.init(frame: frame)
        self.viewModel = viewModel
        self.backgroundColor = backgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addNode(value: T){
        viewModel?.insert(value: value)
        setNeedsDisplay()
    }
    
    
    override func draw(_ rect: CGRect) {
        guard let root = viewModel?.root else {
            return
        }
        drawNode(node: root, x: bounds.midX, y: 50, level: 1)
    }
    private func drawNode(node: BinaryTreeNode<T>, x: CGFloat, y : CGFloat, level: Int, diameter : CGFloat = 30, fontsize : CGFloat = 14) {
        let nodeRect = CGRect(x: x - diameter / 2 , y: y - diameter / 2, width: diameter, height: diameter)
        let nodeString = "\(node.value)"
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontsize)]
        let textSize = (nodeString as NSString).size(withAttributes: attributes)
        let textRect = CGRect(x: x - textSize.width / 2, y: y - textSize.height / 2, width: textSize.width, height: textSize.height)
        
        UIColor.black.setStroke()
        UIBezierPath(ovalIn: nodeRect).stroke()
        (nodeString as NSString).draw(in: textRect, withAttributes: attributes)
        
        if let leftChild = node.leftChild {
            let childX = x - CGFloat(pow(2, Double(3 - level))) * 20
            let childY = y + 50
            let path = UIBezierPath()
            path.move(to: CGPoint(x: x, y: y))
            path.addLine(to: CGPoint(x: childX, y: childY))
            path.stroke()
            drawNode(node: leftChild, x: childX, y: childY, level: level + 1, diameter: diameter, fontsize: fontsize)
        }
        
        if let rightChild = node.rightChild {
            let childX = x + CGFloat(pow(2, Double(3 - level))) * 20
            let childY = y + 50
            let path = UIBezierPath()
            path.move(to: CGPoint(x: x, y: y))
            path.addLine(to: CGPoint(x: childX, y: childY))
            path.stroke()
            drawNode(node: rightChild, x: childX, y: childY, level: level + 1, diameter: diameter, fontsize: fontsize)
            
        }
    }
}
