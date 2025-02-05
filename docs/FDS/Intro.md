# 引入

## 阶

* 比较阶两种方法：1、相除，极限是否为一个非零的正实数；2、看是否存在一个正实数，使得最终大于或者小于。

* 比较阶构成了**偏序关系**。阶上界 $O$（小于等于），阶下界 $\Omega$（大于等于），同阶 $\Theta$（等于），不同阶的阶上界用 $o$（小于）。其他说法是 $lub$（最小上界，上确界）、$glb$（最大下界，下确界）

----

## 阶的常用结论

* 线性运算： $O(f(n)) + O(f(n))=O(f(n))$ 、$O(f(n))- O(f(n)) = O(f(n))$ 

* 对任意大于1的实数 $k$，$log^k\ n = O(n)$

* **调和级数部分和**和 $ln\ n$ 等阶

* $e^{\sqrt{ln\ x}}$比 $ln\ x$ 阶要大（换元）

* 若 $f(x) = O(g(x))$，则 $ln(f(x)) = O(ln(g(x)))$

* 阶乘的阶（*Stirling 公式*）

----

## 复杂度

* 复杂度是近似的运行时间、运行所用空间，能反映算法随问题规模变化的大致增长速度。复杂度低不等于在某个规模下时间少。

* 循环的时间复杂度分析：求和

* 递归的时间复杂度分析：递推。求出递归函数关于参数的时间复杂度的递推式。

* 空间复杂度：开的数组（静态空间）、栈空间、堆空间

----

## 递归函数分析

* 递归参数范围：递归函数参数不一定是整个正整数，比如快速排序在n很小的时候停止递归而采用了插入排序。好的参数范围设计是递归函数
设计正确性的保障。

* 画递归树

* *空间复杂度*和*递归树的深度*成正比。*时间复杂度*不一定和*递归树节点数*成正比。

* *尾递归*优化优化的是*空间复杂度*（$O(n)$ -> $O(1)$），*时间复杂度*不变。

### 数学技巧

* 生成函数

* **主定理**：对于正实数 $c$ 、 $k$ ，数列 $a_n$、数列 $f(n)$ ， $a_n=c\ a_{n/k}+f(n)$，比较 $n^{log_k\ c}$ 与 $f(n)$的关系：*小于*则复杂度 $n^{log_k\ c}$；*等于*则 $n^{log_k\ c} \ log\ n$ ；*大于*则 $f(n)$