##what is lspcdsdmsvn<br>
Cadence Virtuoso Design Management System using svn<br>
<br>
##工具说明<br>
1、基于svn的virtuoso library管理工具，多人协作，共同开发virtuoso library数据；<br>
2、支持最基本的svn cmd，实现library管理功能，未完全使用完整的svn功能<br>  
3、支持init、、checkin、checkout、cancel checkout、update、status、tag、delete功能；<br>
    init：从svn server下载library，等同svn co；<br>
	checkin：上传本地数据，并关闭写权限，完成之后无法修改文件，需要通过checkout修改，防止多人同时修改，等同svn ci；<br>
	checkout：锁住要修改的数据，防止其他人同时修改，并打开写权限，等同svn lock；<br>
	cancel checkout：丢弃本地数据，同步svn server中最新的数据，并关闭写权限；等同svn unlock+svn revert；<br>
	update：从server下载最新的数据，等同svn up；<br>
	status：查看本地数据的状态，包括是否修改、lock等，等同svn st；<br>
	tag：标记某些版本，记录信息，方便查询；<br>
	delete：删除数据，支持本地或者svn可选；<br>
4、不具有svn创建library的能力，需要管理员提前准备好library的svn创建，可以是空的library；<br>
5、如果有一些library/cell不需要进行svn管理，可以在config目录下的ignore.cfg中添加，支持egrep的正则匹配；<br>
6、如果有cellview下面的文件需要进行svn管理，可以在config目录下的include.cfg中添加，支持egrep的正则匹配；<br>
<br>
##环境必备<br>
1、必须安装csh，路径/bin/csh；<br>
2、必须安装zenity；<br>
3、必须安装svn；<br>
<br>
##tool安装步骤<br>
1、下载解压数据包到某个路径；<br>
2、修改lspcdsdmsvn.cshrc第一行的路径为解压之后的路径；<br>
3、cd $LSPCDSDMSVN_HOME/bin目录，查看里面所有的文件是否是可执行状态，如果不是，执行chmod +x *；<br>
<br>
##使用步骤<br>
1、在cds.lib的同级目录下执行lspcdsdmsvn_init；如果已经执行过无需再执行(手动初始化可以参考lspcdsdmsvn_init脚本步骤)；<br>
2、启动virtuoso；<br>
3、enjoy it；<br>
<br>
#维护说明<br>
基于自己的小项目自主研发，已经实现最基本的多人数据协同开发。新需求可以自行添加，有时间也会不定期更新。欢迎交流。<br>
<br>