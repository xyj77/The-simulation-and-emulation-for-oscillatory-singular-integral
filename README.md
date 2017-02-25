# The-simulation-and-emulation-for-oscillatory-singular-integral
首先运用最速下降法将振荡奇异积分转化为非振荡且呈指数级衰减的积分，再利用Gauss-Laguerre求积公式高效逼近振荡奇异积分，得到振荡奇异积分数值求积公式。利用Matlab在求积公式的基础上实现振荡奇异积分的求积算法，通过Matlab GUI实现对一次振荡奇异积分和二次振荡奇异积分数值求积的模拟与仿真，并结合具体实例对求积公式的正确性进行验证，通过与经典数值求积方法进行对比的实验显示求积公式的良好逼近效果，实验结果与理论分析相符。


振荡奇异求积模拟与仿真（最低版本MATLAB2013环境下运行）

M文件：

	Ak:计算Gauss-Laguerre求积系数；	
        Cnm：组合数；	
        Draw：绘图；	
        Ei:计算指数积分；	
        gausslaguerre：Gauss-Lagureer求积；	
        gausslegendre：Gauss-Legendre求积；	
        I_Er：一次、二次积分值计算；	
        I_ErExp：一次示例1误差；	
        I_ErSinh：一次示例2误差；	
        Laguerre：生成Laguerre多项式；	
        Main：	一次振荡奇异积分入口；	
        Main2：	二次振荡奇异积分入口；	
        Si：	正弦积分；	
        Team：	二次实验；	
        Welcome：系统入口；
        
界面说明：

	File->Open:打开文件；	
        File->New:新建文件；	
        样例：一次积分两个示例
	默认：自动填充参数；	
        绘图->最速下降分析:一次算出误差后的分析误差，计算结果不需分析。
	f(x):输入被积函数非奇异非振荡部分；	
        w:输入振荡频率（四个正整数，用“，”隔开）；	
        n：输入求积节点数目（三个正整数，用“，”隔开）；	
        t：输入奇异点（-1< t < 1)；
        “开始计算”：计算积分值；	
        “清空图表”：清空右侧数据和图形；
