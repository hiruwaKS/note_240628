# 优先队列

## Term

* 堆 / d堆 的定义、最大堆、最小堆

* 标兵 <del>南派vs北派</del>

----

## 满二叉树的性质

<img src="../heap.png">

有标兵（起始序号为1），树的大小是N：

* 最后一个结点序号： $N$ 
* 最后一个非叶结点/非叶结点数量： $\lfloor \frac{N}{2} \rfloor$ ；叶结点数量/第一个叶节点：略
* 深度为d的层的起始序号： $2^d$
* 1度结点数量：N偶数为 $1$ ，N奇数为 $0$
* x的子节点： $2x$ ， $2x+1$；父节点：$\lfloor \frac{x}{2} \rfloor$

----

## 上滤/下滤

* 签名：(堆, 位置) 无返回
* 过程：更新 `tmp`  -> 循环（移动指针、对应位置赋值） -> 对应位置赋值 `tmp` 
* 每一步循环的工作：将 `p` 指针的元素用"应该的位置" `p'` 的元素更新，再把 `p` 更新为 `p'`
* 循环结束：`p` 应该停在最后一个"应该的位置"
* 时间复杂度：$O(log\ n)$
* `deleteMin/Max` ：将第一个元素返回，然后将最后一个元素放在第一个位置，下滤
```c
// copied from cy's PPT

Child = i * 2; 
if (Child != H->Size && H->Elements[Child+1] < H->Elements[Child]) 
Child++;
if ( Element > H->Elements[ Child ] )   /* Percolate one level */ 
    H->Elements[ i ] = H->Elements[ Child ]; 
else break;   /* find the proper position */
```

----

## 建堆

* 逐个插入可行，从前往后下滤不可行，从后往前上滤可行。
* 逐个插入时间复杂度 $O(n\ log\ n)$ ，证明方法：略
* 从后往前上滤算法时间复杂度 $O(n)$ ，证明方法：差比数列求和
* 从后往前上滤算法的优化：从最后一个非叶节点向前

----

## d堆

* 更浅；堆过大不能放在内存时使用它
* 父、第一子、最后一个子： $\lfloor \frac{i+d−2}{d} \rfloor$ ,  $(i−1)d+2$ ,  $id+1$ 
* 如果 $d$ 不是2的幂，乘除计算开销大
* 不好合并

----

## 最小最大堆 Min-Max Heap

* 根节点是最小元，第二层的最大结点是最大元

----

## 堆的应用

* 进程调度
* 很多需要最值元素的算法，比如 `Dijkstra` 
* 前k个最值元素
