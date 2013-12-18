firefox-26.0 for linux 自编译版:

1)使用gcc4.7.2 -O3 sse2 参数优化.betterpgo编译.
2)移除自动升级,崩溃报告,健康报告,webapp等组件,移除CNNIC证书.
3)对默认参数做了微调,集成中文语言.
4)集成flashplay_x64 for linux与支付宝64bit插件.
===================================================================

debian/ubuntu 安装:

删除系统firefox浏览器:
sudo apt-get remove firefox
删除所有的语言包:
cd /usr/lib/firefox-addons/extensions
sudo rm -r langpack-*

或者
sudo aptitude remove firefox-locale-*
sudo aptitude remove firefox-globalmenu
安装依赖库:
sudo apt-get install libglib2.0 libcairo2 libsqlite3-dev libgstreamer-plugins-base0.10-0
安装新的浏览器:
sudo dpkg -i firefox-private-26.0.zh-CN.linux-x86_64.deb

删除集成的插件:
sudo rm -f /usr/lib/firefox/browser/plugins

卸载:
sudo dpkg -r firefox-private

禁止内核升级：
echo "linux-generic hold" | dpkg --set-selections
echo "linux-headers-generic hold" | dpkg --set-selections

====================================================================

fedora/linux安装:

删除系统firefox浏览器:
sudo yum remove firefox
安装依赖库:
sudo yum install cairo sqlite alien
安装新的浏览器:
sudo alien -r firefox-private-26.0.zh-CN.linux-x86_64.deb
sudo rpm -ivh --force --nodeps firefox-private-26.0.zh-CN.linux-x86_64.rpm

卸载:
sudo rpm -e firefox-private

=====================================================================
备注:
新增加libgstreamer支持.
