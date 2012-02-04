# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Artyom Olshevskiy <siasia@siasia>
pkgname=yajsw-beta
pkgver=10.10
pkgrel=1 
pkgdesc="Enables a Java Application to be run as a Windows Service or Unix Daemon"
url="http://yajsw.sourceforge.net"
arch=('x86_64 i686')
license=('LGPL')
depends=(java-runtime)
source=(http://sourceforge.net/projects/yajsw/files/yajsw/$pkgname-$pkgver/$pkgname-$pkgver.zip/download)
md5sums=('0f07bd1dea9eefabda48c8a47538b2b2')

build() {
	mkdir -p $pkgdir/usr/share/java/yajsw
	cd $pkgdir/usr/share/java/yajsw
	cp -r $srcdir/$pkgname-$pkgver/* .
}

