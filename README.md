# BinarySearchTree
二叉搜索树：插入、查找、删除  

二叉搜索树Binary Search Tree(BST)可以提高查找、插入和删除的效率，时间复杂度都为O(log n)。
## 成为二叉搜索树必须满足下面两个条件：
* 左子节点的值必须小于它的父节点的值
* 右子节点的值必须大于或等于它的父节点的值

## 查找 
使用while循环，从 root 开始，如果当前节点的值等于要查找的值，则返回 true；如果要查找的值小于当前节点的值，把当前节点的左节点作为下一轮循环的节点，否则把当前节点的右节点作为下一轮循环的节点。
## 插入
首先判断node(第一次为root根节点)是否为 nil，如果是 nil，返回一个新的 node；如果要插入的值小于当前 node 的值，利用递归把它插到左子节点；否则插到右子节点，最后返回当前 node
## 删除
删除需要考虑这几种情况：1）移除叶节点；2）移除只有一个子节点的节点；3）移除有两个子节点的节点。  
1.左右子节点都为空，当前节点为叶节点，直接通过返回nil来删除  
2.左右子节点中，有其中一个为空，返回另外一个不为空的子节点，当前的 node 就会被删除  
3.左右子节点都不为空：把当前 node 的值更新为右子节点的最小值，然后把右子节点的最小值删除  

### 实例
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

### 打印
0  
1  
2  
3  
4  
5  
6  
7  
8  
9  
10  
5 isContain:true  
remove 5  
0  
1  
2  
3  
4  
6  
7  
8  
9  
10  
