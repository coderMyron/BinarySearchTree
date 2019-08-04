//
//  BinaryTreeNode.swift
//  BinaryTreeNode
//
//  Created by Myron on 2019/8/4.
//  Copyright © 2019 Myron. All rights reserved.
//

final class BinaryTreeNode<T> {
    var value: T
    var leftChild: BinaryTreeNode?
    var rightChild: BinaryTreeNode?
    
    init(_ value: T) {
        self.value = value
    }
}

// MARK: - Traverse
extension BinaryTreeNode {
    //MARK: 中序遍历 左根右
    func traverseInOrder(_ closure: (T) -> Void) {
        leftChild?.traverseInOrder(closure)
        closure(value)
        rightChild?.traverseInOrder(closure)
    }
    
    //MARK: 前序遍历 根左右
    func traversePreOrder(_ closure: (T) -> Void) {
        closure(value)
        leftChild?.traversePreOrder(closure)
        rightChild?.traversePreOrder(closure)
    }
    
    //MARK: 后序遍历 左右根
    func traversePostOrder(_ closure: (T) -> Void) {
        leftChild?.traversePostOrder(closure)
        rightChild?.traversePostOrder(closure)
        closure(value)
    }
}
