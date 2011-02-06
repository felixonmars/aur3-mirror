# $Id: PKGBUILD,v 1.2 2006/07/20 21:29:48 andyrtr Exp $
# Maintainer: simo <simo@archlinux.org>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw
pkgname=xmms-shell
pkgver=0.99.3
pkgrel=2
pkgdesc="Utility for controlling XMMS externaly"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/xmms-shell/"
license=('GPL')
depends=('xmms' 'readline')
source=(http://dl.sourceforge.net/xmms-shell/$pkgname-$pkgver.tar.gz)
md5sums=('7c59ff584ae146282259fd6cdc8fe669')

build() {
    cd $startdir/src/$pkgname-$pkgver

    # gcc fix
    sed -i "s/<string>/<string.h>/" src/getline.cc

    ./configure --prefix=/usr
    make || return 1
    make DESTDIR=$startdir/pkg install
}
