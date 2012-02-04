# Maintainer: skyround <skyround@163.com>

pkgname=libipmsg
pkgver=0.1.7
pkgrel=1
pkgdesc="bipmsg - IP Messenger library for UNIX"
url="http://libipmsg.sourceforge.jp"
license=('GPL2')
arch=('i686')
source=(http://iij.dl.sourceforge.jp/libipmsg/30890/$pkgname-$pkgver.tar.gz)

build() {
        cd $startdir/src/$pkgname-$pkgver
         ./configure --prefix=/usr
        make || return 1
        make DESTDIR=$startdir/pkg install
}
md5sums=('74fa02667a71a40a6c355ff938e27b31')
