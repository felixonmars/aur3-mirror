# Maintainer: zhn <zhangn1985 AT gmail com>

pkgname=adb
pkgver=4.1
pkgrel=1
pkgdesc="adb host for Linux"
arch=("i686" "x86_64")
license=('Apache')
url="http://www.android.com"
makedepends=('git' 'autoconf')

__giturl="git://github.com/zhangn1985/adb.git"
__gitname="adb"
__gitbranch="JellyBeans"
build() {
	cd ${srcdir}
	if [ -d ${__gitname} ];then
		cd ${__gitname}
		git pull
		git checkout ${__gitbranch}
	else
		git clone ${__giturl}
		cd ${__gitname}
		git checkout ${__gitbranch}
	fi
	./auto.sh --prefix=/usr
}
package(){
	cd ${srcdir}/${__gitname}
	make DESTDIR=${pkgdir} install
}


