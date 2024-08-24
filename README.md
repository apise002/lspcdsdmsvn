what is lspcdsdmsvn
Cadence Virtuoso Design Management System using svn

工具说明
1、基于svn的virtuoso library管理工具，多人协作，共同开发数据；
2、支持最基本的svn cmd，实现library管理功能，未完全完整的svn自带功能；
3、支持init、、checkin、checkout、cancel checkout、update、status、tag、delete功能；
    init：从svn server下载library，等同svn co；
	checkin：上传本地数据，并关闭写权限，等同svn ci；
	checkout：锁住要修改的数据，防止其他人同时修改，并打开写权限，等同svn lock；
	cancel checkout：丢弃本地数据，同步svn server中最新的数据，并关闭写权限；等同svn unlock+svn revert；
	update：从server下载最新的数据，等同svn up；
	status：查看本地数据的状态，包括是否修改、lock等，等同svn st；
	tag：标记某些版本，记录信息，方便查询；
	delete：删除数据，支持本地或者svn可选；
4、不具有svn创建library的能力，需要管理员提前准备好library的svn创建，可以是空的library；
5、如果有一些数据不需要进行svn管理，可以在config目录下的ignore.cfg中添加，支持egrep的正则匹配；
6、如果有cellview下面的文件需要进行svn管理，可以在config目录下的include.cfg中添加，支持egrep的正则匹配；

环境必备
1、必须安装csh，路径/bin/csh；
2、必须安装zenity；
3、必须安装svn；

tool安装步骤
1、下载解压数据包到某个路径；
2、修改lspcdsdmsvn.cshrc第一行的路径为解压之后的路径；
3、cd $LSPCDSDMSVN_HOME/bin目录，查看里面所有的文件是否是可执行状态，如果不是，执行chmod +x *

使用步骤
1、在cds library的同级目录下执行lspcdsdmsvn_init；如果已经执行过无需再执行；(手动初始化可以参考lspcdsdmsvn_init脚本步骤)
2、启动virtuoso；
3、enjoy it；

维护说明
基于自己的小项目自主研发，已经实现最基本的多人数据协同开发。新需求可以自行添加，有时间也会不定期更新。欢迎交流。
