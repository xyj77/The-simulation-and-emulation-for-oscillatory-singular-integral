振荡奇异求积模拟与仿真（最低版本MATLAB2013环境下运行）

M文件：
	Ak:         计算Gauss-Laguerre求积系数
	Cnm：       组合数
	Draw：	    绘图
	Ei:         计算指数积分
	gausslaguerre：	Gauss-Lagureer求积
	gausslegendre：	Gauss-Legendre求积
	I_Er：		一次、二次积分值计算
	I_ErExp：	一次示例1误差
	I_ErSinh：	一次示例2误差
	Laguerre：	生成Laguerre多项式
	Main：		一次振荡奇异积分入口
	Main2：		二次振荡奇异积分入口
	Si：            正弦积分
	Team：		二次实验
	Welcome：	系统入口

界面说明：
	File->Open:     打开文件
	File->New:      新建文件
	样例：          一次积分两个示例
	默认：          自动填充参数
	绘图->最速下降分析:一次算出误差后的分析误差，计算结果不需分析。
	f(x):           输入被积函数非奇异非振荡部分(运算符之前加“.”)
	w:              输入振荡频率（四个正整数，用“，”隔开）
	n：             输入求积节点数目（三个正整数，用“，”隔开）
	t：             输入奇异点（-1<t<1）
	“开始计算”：   计算积分值
	“清空图表”：   清空右侧数据和图形
	