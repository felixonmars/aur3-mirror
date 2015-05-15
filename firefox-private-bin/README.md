### Firefox 38.0 for Linux 自编译版：

1. 使用 `GCC O3 SSE2` 编译参数；
2. `BetterPGO` 编译；
3. 做了适当的精简、中文化；
4. ~~集成了 [FlashPlayer_Linux_x64][1] 与[支付宝官方的 Linux x64 插件][2]（可删除）；~~
5. ~~打包成 `Deb` 格式，安装即用（有说明）。~~

===================================================================

### 更新说明：

2015-05-l0 更新：

1. `GCC 4.8.2 -O3` 编译，支持 `gstreamer 0.10.x` （API/ABI）；
2. 加入了一个 `MOZILLA_DISABLE_PLUGINS` 环境变量（设为 1 时禁止插件启动，同步 Iceweasel 特性）；
3. 启用 unified source 构建，启用了 `CLooG` 优化；
4. 支持 Ubuntu Unity 桌面的全局菜单，需设置 `user_pref("ui.use_unity_menubar", true)`；
5. 修改包名为 `firefox-private`，以防止 Linux 发行版滚动更新时被覆盖；
   ~~（如需卸载，请使用 `sudo dpkg -r firefox-private`）~~
6. 兼容绝大部分 Linux 操作系统。

===================================================================

### What's new (05/10/2015):

1. `gcc 4.8.2 -O3` with graphite optimization.
2. ~~Embedded [Flash(x64) plugin][1] and [Alipay(x64)][2] plugins.~~
3. Support for `media-libs/gstreamer`.
4. Support for Ubuntu's Unity global menu.
   (type in `about:config` and change the value of the line `ui.use_unity_menubar` to `true`)
5. Add a `MOZILLA_DISABLE_PLUGINS` environment variable to Firefox.
6. ~~Deb package build.~~

===================================================================

#### 注： 带有~~删除线~~（被`~~`包围）的行不适用于 Arch Linux。
#### Note： The lines marked with ~~strikethrough~~(surround with `~~`) are not available for Arch Linux.

===================================================================

### 参见：
### See also:

* [下载地址][3]
* [Download link][3]

* [论坛反馈地址][4]
* [Feedback Thread][4]

[1]: http://get.adobe.com/flashplayer
[2]: https://cshall.alipay.com/lab/help_detail.htm?help_id=240951
[3]: http://sourceforge.net/projects/libportable/files/Firefox/
[4]: http://bbs.kafan.cn/thread-1611465-1-1.html
