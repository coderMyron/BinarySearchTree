//
//  BinarySearchTree.swift
//  BinarySearchTree
//
//  Created by Myron on 2019/8/4.
//  Copyright © 2019 Myron. All rights reserved.
//

struct BinarySearchTree<Element: Comparable> {
    private(set) var root: BinaryTreeNode<Element>?
    init() {  }
}

// MARK: - 查找
extension BinarySearchTree {
    func contains(_ value: Element) -> Bool {
        var current = root
        while let node = current {
            if node.value == value {
                return true
            }
            if value < node.value {
                current = node.leftChild
            } else {
                current = node.rightChild
            }
        }
        return false
    }
}

// MARK: - 插入Insert
extension BinarySearchTree {
    mutating func insert(_ value: Element) {
        root = insert(from: root, value: value)
    }
    
    private func insert(from node: BinaryTreeNode<Element>?,
                        value: Element) -> BinaryTreeNode<Element> {
        guard let node = node else {
            return BinaryTreeNode(value)
        }
        if value < node.value {
            node.leftChild = insert(from: node.leftChild, value: value)
        } else {
            node.rightChild = insert(from: node.rightChild, value: value)
        }
        return node
    }
}

// MARK: - 删除Remove
extension BinaryTreeNode {
    //MARK: 节点右边的最小值
    var minNode: BinaryTreeNode {
        return leftChild?.minNode ?? self
    }
}

extension BinarySearchTree {
    mutating func remove(_ value: Element) {
        root = remove(node: root, value: value)
    }
    
    private func remove(node: BinaryTreeNode<Element>?,
                        value: Element) -> BinaryTreeNode<Element>? {
        
        guard let node = node else { return nil }
        
        if node.value == value {
            // 左右子节点都为空，删除当前节点，为nil
            if node.leftChild == nil && node.rightChild == nil {
                return nil
            }
            // 左子节点为空，删除当前节点，当前节点变为右节点
            if node.leftChild == nil {
                return node.rightChild
            }
            // 右子节点为空，，删除当前节点，当前节点变为左节点
            if node.rightChild == nil {
                return node.leftChild
            }
            // 左右子节点都不为空
            // 把当前节点的值更新为右子节点的最小值
            node.value = node.rightChild!.minNode.value
            // 把右子节点的最小值删除
            node.rightChild = remove(node: node.rightChild, value: node.value)
            
        } else if value < node.value {
            node.leftChild = remove(node: node.leftChild, value: value)
        } else {
            node.rightChild = remove(node: node.rightChild, value: value)
        }
        
        return node
    }
}
