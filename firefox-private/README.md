### Firefox-30.0 for Linux 自编译版:

1. 使用gcc O3 SSE2编译参数.
2. BetterPGO编译.
3. 做了适当的精简,中文化.
4. 集成了FlashPlayer_linux_x64与支付宝官方的linux x64插件(可删除).
5. 打包成deb格式，安装即用(有说明).

===================================================================

### Debian/Ubuntu 安装:

删除系统Firefox浏览器:
```
sudo apt-get remove firefox
```
删除所有的语言包:
```
cd /usr/lib/firefox-addons/extensions
sudo rm -r langpack-*
```

或者
```
sudo aptitude remove firefox-locale-*
sudo aptitude remove firefox-globalmenu
```
安装依赖库:
```
sudo apt-get install libglib2.0 libcairo2 libsqlite3-dev libgstreamer-plugins-base0.10-0
```
安装新的浏览器:
```
sudo dpkg -i firefox-private-26.0.zh-CN.linux-x86_64.deb
```

删除集成的插件:
```
sudo rm -f /usr/lib/firefox/browser/plugins
```

卸载:
```
sudo dpkg -r firefox-private
```

禁止内核升级：
```
echo "linux-generic hold" | dpkg --set-selections
echo "linux-headers-generic hold" | dpkg --set-selections
```

====================================================================

### Fedora/Linux安装:

删除系统Firefox浏览器:
```
sudo yum remove firefox
```
安装依赖库:
```
sudo yum install cairo sqlite alien
```
安装新的浏览器:
```
sudo alien -r firefox-private-26.0.zh-CN.linux-x86_64.deb
sudo rpm -ivh --force --nodeps firefox-private-26.0.zh-CN.linux-x86_64.rpm
```

卸载:
```
sudo rpm -e firefox-private
```

=====================================================================

### 更新说明:

2014-06-05更新：
1. 加入了libgstreamer支持.
2. 加入了一个MOZILLA_DISABLE_PLUGINS环境变量(设为1时禁止插件启动,同步Iceweasel特性)
3. 修改包名为firefox-private,以防止linux发行版滚动更新时被覆盖.
   (如需卸载,请使用sudo dpkg -r firefox-private)
4. 启用unified source构建,启用了cloog优化.
5. 编译centos/rhel linux (6.2或以上) 版本支持.
