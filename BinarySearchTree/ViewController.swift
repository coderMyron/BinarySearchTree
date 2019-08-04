//
//  ViewController.swift
//  BinarySearchTree
//
//  Created by Myron on 2019/8/4.
//  Copyright © 2019 Myron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var bst = BinarySearchTree<Int>()
        (0...10).forEach { (i) in
            bst.insert(i)
        }
        bst.root?.traverseInOrder({ (num) in
            print("\(num)")
        })
        
        let isContain = bst.contains(5)
        print("5 isContain:\(isContain)")
        
        print("remove 5")
        bst.remove(5)
        bst.root?.traverseInOrder({ (num) in
            print("\(num)")
        })
        
    }


}

