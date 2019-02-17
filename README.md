# mofn
  matlab code.  
Method of creating minimal-order Markov set and transition states of m/n sliding window.  

The following functions get from paper "Analysis and Design of Sliding m-of-n Detectors":  

- mofn_setup_opt  形成m/n的整个最小状态集结构，采用的是William的创建方法
- binnum
- addhexad_opt
- reduce_hexad
- mofn_states     用于生成J+, J-这两个指示矩阵（indicator matrices）， j+ 指示向量(indicator vector)
- mofn_pd         用于计算某个k时刻进入吸收状态的概率 


The following functions using new method to create minimal-order Markovset.

- mofn_setup_opt2 形成m/n的整个最小状态集结构，采用的是zhaokang的创建方法
- mofn_hp
- mofn_hm
- mofn_w
- mofn_williams_pd  用Williams的方法求解pd.用于计算某个k时刻进入吸收状态的概率 