# Maintainer: Krisoijn Chan <ksc at gmx dot us>

pkgname=synctool
pkgver=4.7.1
pkgrel=2
pkgdesc="A configuration management tool for working with clusters of computers."
arch=('any')
url="http://www.heiho.net/synctool/"
license=(GPL2)
depends=('python2' 'openssh' 'rsync')
source=(http://www.heiho.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('1792eb9397d1fea56163a5292851fbd6')

build() {
    cd $srcdir/$pkgname-$pkgver/src

    # fix broken links
    sed -i 's/ln -sf $(MASTERBIN)/ln -sf \/var\/lib\/synctool\/sbin/g' Makefile

    make PREFIX=$pkgdir/usr MASTERDIR=$pkgdir/var/lib/synctool install
}

package() {
    cd $srcdir/$pkgname-$pkgver

    # contrib
    mkdir -p $pkgdir/usr/share/synctool/
    cp -a contrib $pkgdir/usr/share/synctool/

    # example
    install -m644 synctool.conf.example $pkgdir/var/lib/synctool/

    # python2
    sed -i '1s|^#!.*|#!/usr/bin/env python2|' \
        $(find $pkgdir -name *.py)
}
