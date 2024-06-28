# 排序算法

* 所有排序的最好情况 $O(N)$ （必须扫描一遍才知道有序）
* 基于交换的排序，平均时间复杂度为 $\Omega(N^2)$ 
* 基于比较的排序，可以证明它的最坏情形时间复杂度信息理论下界为 $\Omega(N\ log\ N)$
>见书p297

## 插入排序

* 可以不做交换，先留出一个空位，然后让它前面的所有大于/小于它的元素右移动一个索引，类似于上/下滤
* 从第一个元素开始

* 定理1：插入的总次数等于排列的逆序数
* 定理2：N元素排列的平均逆序数是 $\frac{N(N-1)}{4}$ ；证明：考察它的反序

* 比较次数一定大于交换次数
* 比较次数小于等于 $\frac{N(N-1)}{2}$ 

----

## Shell排序

* *Shell Increment*: 不好，但是写法简单， $h_1 = \lfloor \frac{N}{2} \rfloor$； $h_n = \lfloor \frac{h_{n-1}}{2} \rfloor$
* *Hibbard Increment*: $1,3,7,...2^k-1$；没有公因子，上界 $O(N^{3/2})$
* *Sedgewick Increment*: 复杂，实践中表现很好

----

## 堆排序

* 时间复杂度： $2 N\ log\ N - O( N\ log\ (log\ N) )$
>见书P271
* 空间复杂度：本来需要一个辅助数组，可以优化成在原数组内部做， $O(1)$ 
* 优化空间复杂度的写法：使用带有数组长度信息的 `percolateDown` ，每次数组长度自减
* 实践中不如 Shell排序 的 *Sedgewick Increment*

----

## 归并排序

* 优点：稳定的排序算法，可用于外部排序，写法简单；缺点：多余空间
* 时间复杂度： $O(N\ log\ N)$
* 空间复杂度：如果 locally 开辟，则 $O(N\ log\ N)$，使用全局数组， $O(N)$

----

## 快排

* 快排是在实际应用中最优的排序算法
* 快排最好时间复杂度是 $O(N\ log\ N)$，对应于每次 pivot 在中间
* 最坏时间复杂度是 $O(N^2)$，对应于每次 pivot 在边缘
* 快排的题目要找到 pivot 的位置，如果没有遇到边缘的 pivot ，一次 run 后1个 pivot ，两次 run 后3个 pivot 

??? note "快排的题目"
    
    During the sorting, processing every element which is not yet at its final position is called a "run". Which of the following cannot be the result after the second run of quicksort?
    
     A. 5, 2, 16, 12, 28, 60, 32, 72
    
     B. 2, 16, 5, 28, 12, 60, 32, 72
    
     C. 2, 12, 16, 5, 28, 32, 72, 60
    
    (D) 5, 2, 12, 28, 16, 32, 72, 60

### 步骤

* 当数据规模比较小的时候，应该使用插入排序
*  pivot 的选择：前中后三者选中位数，并且**依次放在最左，最右的左边，最右**，最开始最左
*  `i` 、 `j` 的初始值应该是最左和最右减去1，这对应着 `while` 里面使用 `++i` 、 `++j` 的写法
* 移动 `i` 、 `j` ：移动到第一次出现大于等于/小于等于 pivot 的地方，如果此时i和j是顺序，说明应该交换，如果是逆序，说明应该退出
* 最后，pivot要放在 `i` 的位置

### 移动的分析

1. 每次至少移动 $1$ 
2. 每次移动后，所有 `i` 、 `j` 两侧的部分，除了和 pivot 相关的两个元素，都处于最终的位置
3. 为了保证算法能够顺利结束，一定要让 `i` 大于 `j` ，由第一点可以证明


??? note "code"

    ```c
    // from cy's PPT

    ElementType Median3( ElementType A[ ], int Left, int Right ) { 
        int  Center = ( Left + Right ) / 2; 
        if ( A[ Left ] > A[ Center ] ) 
            Swap( &A[ Left ], &A[ Center ] ); 
        if ( A[ Left ] > A[ Right ] ) 
            Swap( &A[ Left ], &A[ Right ] ); 
        if ( A[ Center ] > A[ Right ] ) 
            Swap( &A[ Center ], &A[ Right ] ); 

        /* Invariant: A[ Left ] <= A[ Center ] <= A[ Right ] */ 
        Swap( &A[ Center ], &A[ Right - 1 ] ); /* Hide pivot */ 

        /* only need to sort A[ Left + 1 ] … A[ Right – 2 ] */
        return  A[ Right - 1 ];  /* Return pivot */ 
    }

    void Qsort( ElementType A[ ], int Left, int Right ) {
        int  i,  j; 
        ElementType  Pivot; 
        if ( Left + Cutoff <= Right ) {  /* if the sequence is not too short */

            Pivot = Median3( A, Left, Right );  /* select pivot */
            i = Left;     j = Right – 1;  /* why not set Left+1 and Right-2? */
            for( ; ; ) { 
                while ( A[ + +i ] < Pivot ) { }  /* scan from left */
                while ( A[ – –j ] > Pivot ) { }  /* scan from right */
                if ( i < j ) 
                    Swap( &A[ i ], &A[ j ] );  /* adjust partition */
                else     break;  /* partition done */
            } 

            Swap( &A[ i ], &A[ Right - 1 ] ); /* restore pivot */ 
            Qsort( A, Left, i - 1 );      /* recursively sort left part */
            Qsort( A, i + 1, Right );   /* recursively sort right part */
        }  /* end if - the sequence is long */
        else /* do an insertion sort on the short subarray */ 
            InsertionSort( A + Left, Right - Left + 1 );
    }

    ```

## Table Sort

* 定理：每个置换都包含若干个循环
* 用于需要最少移动次数的场合（比如大文件），先在表里排序，然后去找到它的循环，重复直到每一个循环被处理
* 时间复杂度：$T = O( m\ N )$，$m$ 是文件大小

----

## 桶排

* 写法最简单。时间复杂度：线性；但空间复杂度正比于数据范围，对于大整数、字符串不能用

----

## radix sort

* LSD： `最低位分桶` -> `收集最低位` -> `次低位分桶` （必须按顺序放进去）-> `次低位收集` ->...-> `最低位分桶` （必须按顺序放进去）-> `最低位收集`

* MSD： `最高位大桶` -> `次高位中桶` ->...-> `最低位小桶` -> `收集最低位` ->...-> `收集次高位` -> `收集最高位` 

* 执行上， LSD 是线性的，每次桶一样大，类比于迭代；MSD是树形的，越分越小，类比于递归

* LSD 限制了全程只能 LSD ，而 MSD 可以在小桶中使用别的排序算法

* 因为 MSD 越分越小，效率可能比 LSD 高

* MSD： MSD 基数排序适用于处理大范围的数据，特别是当数据具有不均匀分布的情况下。它在处理字符串排序时也很常用。LSD基数排序适用于处理数字范围较小且长度相同的数据，例如固定长度的整数。它在处理大量数字排序时具有较好的性能。(引用自[CSDN](https://blog.csdn.net/a2610033/article/details/134680066))

----

## 稳定性

* 稳定性定义：相同的元素（用于排序的键相等，但其他的field不相等，比如创建时间）排序后顺序不变

* 堆排序、快速排序、希尔排序、直接选择排序不是稳定的排序算法；基数排序、冒泡排序、直接插入排序、折半插入排序、归并排序是稳定的排序算法。（引用自[腾讯云](https://cloud.tencent.com/developer/article/1182321)）

* LSD 稳定，因为 MSD 中可以使用别的排序算法，它的稳定性看的是别的排序算法是否稳定


