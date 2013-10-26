2013-10-18 Firef0x < Firefgx { at } gmail (dot) com >

    ## 1845.*-2 :
	* Add Dependency 'help2man', for generating manual in /usr/share/man
	* Remove Dependency 'ncurses', since 'make'(in group base-devel) depends
	  on it and 'make' is installed by default.

	Following is Simplified Chinese Translation :

	* 添加依赖包help2man，用来生成man文档，放在/usr/share/man下
	* 去掉依赖包ncurses，因为base-devel的包make依赖此包，默认已经安装

	## 1845.*-1 :
	Migrate to GitHub
	(Since I don't know how to work with bazaar and I don't want to install the big bazaar package)
	Fix :
	* Fix GCC 4.6 compilation error ：
		https://bugs.launchpad.net/burg/+bug/775460
	* Fix boot waring for fsck checks rootfs twice since filesystem mounted as read-only ：
		https://bugs.archlinux.org/task/36275
	* Fix OS naming from Arch GNU/Linux to Arch Linux : (Arch official makes GNU feel embarrassed -.-b)
		https://bugs.archlinux.org/task/33393
	* Fix boot failed for /sbin/init not found by changing init to systemd
	* Fix wrong version of Python invoking in autogen.sh
	* Change sbin directory to /usr/bin in configure option
	* Change location of unifont.bdf to /usr/share/fonts/misc in configure file
	* Hide annoying "Grub loading." message :
		https://bugs.launchpad.net/burg/+bug/692706
	* Import Simplified Chinese Translation and improve it (Translation contribution is welcomed)

	Following is Simplified Chinese Translation :

    迁移代码仓库到GitHub（章鱼猫,www.github.com)
	(因为我完全不会搞Bazzar并且不想装bazaar这个包)
	修复：
	* 修复 GCC 4.6 编译错误 ：
		https://bugs.launchpad.net/burg/+bug/775460
	* 修复 文件系统挂载为只读导致fsck检查两次的警告  ：
		https://bugs.archlinux.org/task/36275
	* 修复操作系统命名为Arch Linux : (Arch官方让GNU情何以堪-.-b)
		https://bugs.archlinux.org/task/33393
	* 指定init为systemd，修复启动时找不到/sbin/init导致启动失败
	* 修复autogen.sh调用的Python版本问题
	* 改变sbin目录为/usr/bin
	* 修复unifont.bdf的路径为/usr/share/fonts/misc
	* 隐藏烦人的"Grub loading."提示
		https://bugs.launchpad.net/burg/+bug/692706
	* 引入简体中文翻译并且稍微润色(欢迎各位中国好翻译帮忙完善)

2011-09-24 Keshav P R <(skodabenz) (aatt) (rocketmail) (ddoott) (ccoomm)>

	* 1844-5 :
	Move 'ruby' 'python2' 'ncurses' 'sdl' to makedepends
	Made the PKGBUILD more readable

2011-08-08 fsckd <fsckdaemon@gmail.com>

	* 1844-4 :
	Config generation script now 
	ignores symlinks of kernel images 
	and should correctly handle the 
	old naming scheme as well as the 
	new one.
	Rename folding patch to arch-burg.patch.

	* 1844-3 :
	Edit arch-burg-detection-folding.patch 
	to ignore new kernel (stopgap solution).

2011-06-11 fsckd <fsckdaemon@gmail.com>

	* 1844-3 :
        Merge in burg-emu. Yay!
	New tunable to turn off compiling 
	burg-emu. See the top of the 
	PKGBUILD.
	Change conflicts, replaces and 
	provides arrays. Burg-*-fixed are 
	no longer issues.
	Lots of cleaning up, restructuring 
	and other minor changes.

2011-06-07 fsckd <fsckdaemon@gmail.com>

	* 1844-2 :
	New maintainer (me).
        Fix long standing build bug by 
	adding --disable-werror to the 
	configure options.
	Also switching to sha256sums and 
	lower case changelog file name.

2010-09-24 cruznick <cruznick@archlinux.us>

	* PKGBUILD Changelog 0.1 :
	Well I have implemented some fixes 
	so that it could be posible too 
	run without any more fixing.
	
	10_linux script fixed:
	now folding for Archlinux boot
	entries is working (Thanks to fsckd for the help)

	20_memtest86+ for memtest config:
	Script added so now if you have 
	memtest86+ you can run it from burg
	
	Also added os-prober and memtest86+
	as optional depends
	
	Hope you like this PKGBUILD

	 


