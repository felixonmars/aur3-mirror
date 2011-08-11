# Maintainer: zhn <zhangn1985 AT gmail com>

pkgname=adb
pkgver=2.2
pkgrel=1
pkgdesc="adb host for Linux"
arch=("i686" "x86_64")
license=('Apache')
url="http://www.android.com"
makedepends=('git' 'autoconf')

__giturl="git://github.com/zhangn1985/adb.git"
__gitname="adb"

build() {
	cd ${srcdir}
	if [ -d ${__gitname} ];then
		cd ${__gitname}
		git pull
	else
		git clone ${__giturl}
	fi
	cd ${__gitname}
	./auto.sh --prefix=/usr
}
package(){
	cd ${srcdir}/${__gitname}
	make DESTDIR=${pkgdir} install
}


