//
//  BinaryTreeNode.swift
//  GimmeTree
//
//  Created by Patrick Moscova on 5/1/24.
//

import Foundation

class BinaryTreeNode<T: Comparable> {
    var value : T
    var leftChild: BinaryTreeNode?
    var rightChild: BinaryTreeNode?
    
    init(value: T, leftChild: BinaryTreeNode? = nil, rightChild: BinaryTreeNode? = nil) {
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
}
