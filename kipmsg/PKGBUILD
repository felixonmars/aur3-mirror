# Maintainer: skyround <skyround@163.com>

pkgname=kipmsg
pkgver=0.1.8
pkgrel=1
pkgdesc="This is a pop up style LAN Messenger for KDE"
url="http://kipmsg.sourceforge.jp"
license=('GPL2')
arch=('i686')
depends=('libipmsg')
source=(http://iij.dl.sourceforge.jp/kipmsg/30904/$pkgname-$pkgver.tar.gz)

build() {
        cd $startdir/src/$pkgname-$pkgver
         ./configure --prefix=/usr
        make || return 1
        make DESTDIR=$startdir/pkg install
}
md5sums=('11b16bd6c6a00b96c373b4352acaa81b')
