### Firefox 34.0 for Linux 自编译版:

1. 使用`gcc O3 SSE2`编译参数.
2. BetterPGO编译.
3. 做了适当的精简,中文化.
4. 集成了FlashPlayer_linux_x64与支付宝官方的linux x64插件(可删除).
5. 打包成deb格式，安装即用(有说明).

[下载地址][1]	[论坛反馈地址][2]

=====================================================================

### 更新说明:

2014-12-04更新：

1. gcc4.8.2 -O3编译,支持libgstreamer.
2. 加入了一个MOZILLA_DISABLE_PLUGINS环境变量(设为1时禁止插件启动,同步Iceweasel特性)
3. 修改包名为firefox-private,以防止linux发行版滚动更新时被覆盖.
   (如需卸载,请使用sudo dpkg -r firefox-private)
4. 启用unified source构建,启用了cloog优化.
5. 打包成deb格式,支持debian/ubuntu安装.支持centos/rhel linux (6.2或以上) 版本.

[1]: http://sourceforge.net/projects/libportable/files/
[2]: http://bbs.kafan.cn/thread-1611465-1-1.html
