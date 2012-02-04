# Contributor: uastasi <uastasi@archlinux.us>
pkgname=totem-statusicon
pkgver=0.1
pkgrel=1
pkgdesc="This plugin adds a status icon to control Totem"
url="http://www.infinicode.org/code/totem/"
arch=('i686')
license=('GPL')
depends=('totem')
source=(http://www.infinicode.org/code/totem/$pkgname-$pkgver.tar.gz)
md5sums=('e2a79affa53e1031761b11e7c6427d07')

build() {
    cd $startdir/src/
    mkdir -p $startdir/pkg/usr/lib/totem/plugins/
    cp -R $startdir/src/$pkgname $startdir/pkg/usr/lib/totem/plugins/
    }
