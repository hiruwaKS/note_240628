# 树

## Term

* $Depth(root) = 0$ ,  $Height(leaf) = 0$ 

----

## 遍历

??? note "题目"
    If a general tree T is converted into a binary tree BT, then which of the following BT traversals gives the same sequence as that of the post-order traversal of T? (In-order traversal)

### 从遍历还原树

* 前/中序，中/后序可以还原；前/后序不能还原
* 还原方法：找到 **pivot** ，将树分割成子树，递归

* 对于二叉查找树，前、后可以还原，中序不能还原

### 层序遍历

* 使用队列实现
* 层序遍历的应用：*BFS*

----

## 二叉查找树

### 二叉树

* **二叉树**实际上是节点的指针；空二叉树是空指针。
* **节点**是根节点值和左右二叉树的结构体（左右二叉树节点的链域）。
* *删除*、*插入*、*最小值*和*最大值*、*contains* 都用递归实现。

### 删除

* 删除函数定义：传入可变的树和元素，从树中删除该元素，并且返回删除后的树

??? note "为什么要返回删除后的树"
    删除根节点后，指针会变，所以要让它的调用者使用返回的指针更新树；另一种写法：传入树的引用/树的指针（节点的二级指针）

* 删除函数主要算法：

1.  **树空** ，则错误
2.  **X 在左边** ，将左子树递归地删除，并且用返回的指针更新左子树；X 在右边同理
3.  **X 是根节点值，左右子树均非空** ，则找到最小/最大值 A，更新根节点值，并删除右/左子树中的 A，然后用返回的指针更新右/左子树
4.  **X 是根节点值，若左右子树至少一个空** ，则"排除"一个空子树，返回剩下的那个（也可能空），并且 `free` 掉原来的树

* 也可以用 *Lazy Deletion*，如果再次插入该元素，不必再创建新节点。

### 插入

* **函数定义**：传入可变的树和元素，向树中添加该元素，并且返回添加后的树；写法与删除类似

### 算法分析

* **internal path length** ：从根节点到所有结点路径长之和； $D(N)$ ： N结点子树的内部路径长（具有平均意义）

*  $D(N) = \frac{2}{N} \sum_{j=0}^{N-1}D(j) + N - 1$ ；$D(N) = O(N\ log(N))$

* 普通的插入、删除算法导致的二叉搜索树是不一定**平衡**的，需要用**自调整结构**
* 斜二叉树（ skewed binary tree ）
* 完全二叉树（ complete binary tree ）：结点在相邻的两层
* 满二叉树（ full binary tree ）：没有一度结点

### 题目

1. In a binary search tree which contains several integer keys including 4, 5, and 6, if 4 and 6 are on the same level, then 5 must be their parent. *(F)*
2. If a binary search tree of N nodes is complete, which one of the following statements is FALSE? *(the maximum key must be at a leaf node)*

### 多叉树计数

* 结点的度之和为 $N-1$

## 多叉树

* 一般用 "First Child Next Sibling" 来实现
* 应用：储存目录

## 树的计数

*  $N$ 个结点的二叉树有 $N+1$ 个空链域

* 二叉树结点最大数目

* 对于非空二叉树：满节点（ full node ）个数加一，等于树叶的个数

----

## 树的其他应用

* 层次结构，比如表达式
* *set* 和 *map*
* 图的 **spanning tree**

----

## 拓展

* 树同构

### 树的数组表示

* (T) It is always possible to represent a tree by a one-dimensional integer array.

### 线索二叉树

* 结点结构体（5项）：值、左子树、右子树、左子树是否为线索、右子树是否为线索
* cy PPT 上的 `dummy head` 节点：左节点是真正的第一个遍历结点，右子树是自己，左、右子树并非线索
* 应用：表达式树（ infix ）

### 扩充二叉树

* 所有叶节点加上两个空的叶节点
* 外部路径长：从根节点到所有扩充二叉树的节点的路径长之和；$E=I+2N$

### 决策树

* 对于任意结点，左子树大小大于右子树大小，这样做可以提高查找效率。

### 森林

* 维护多个树

### 地址池

* 与链表的[cursor implementation](../FDS/Linear_Structure.md#cursor_implementation)类似