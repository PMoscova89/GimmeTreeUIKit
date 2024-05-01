//
//  BinaryTreeViewModel.swift
//  GimmeTree
//
//  Created by Patrick Moscova on 5/1/24.
//

import Foundation

class BinaryTreeViewModel<T: Comparable> {
    var root: BinaryTreeNode<T>?
    
    func insert(value: T, recursively isRecurisve: Bool = true ) {
        if isRecurisve == true {
            root = insertRecursively(root, value)
        }else {
            root = insertNonRecursively(root, value)
        }
    
    }
    
    private func insertRecursively(_ node: BinaryTreeNode<T>?, _ value: T) -> BinaryTreeNode<T> {
        guard let node = node else { return BinaryTreeNode(value: value)}
        
        if value < node.value {
            node.leftChild = insertRecursively(node.leftChild, value)
        }else if value > node.value {
            node.rightChild = insertRecursively(node.rightChild, value)
        }
        return node
    }
    
    private func insertNonRecursively(_ rootNode: BinaryTreeNode<T>?, _ value: T ) ->BinaryTreeNode<T>{
        guard var node = rootNode else {
            return BinaryTreeNode(value: value)
        }
        
        var current: BinaryTreeNode<T>? = node
        var parent: BinaryTreeNode<T>?
        
        while current != nil {
            parent = current
            
            if value < current!.value {
                current = current?.leftChild
            }else if value > current!.value {
                current = current?.rightChild
            }
        }
        if let parent = parent {
            if value < parent.value{
                parent.leftChild = BinaryTreeNode(value: value)
            }else {
                parent.rightChild = BinaryTreeNode(value: value)
            }
        }
        
        return node
    }
}
