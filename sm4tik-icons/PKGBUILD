# Maintainer: Thomas Dahms <thdahms (at) gmx (dot) de>

pkgname=sm4tik-icons
pkgver=0.1
pkgrel=1
pkgdesc="8x8 pixmaps by sm4tik. Useful for status lines in minimalistic window managers."
arch=('any')
url="http://dzen.geekmode.org/dwiki/doku.php?id=dzen:icon-packs"
license=()
depends=()
source=(http://koti.24.fi/sm4tik/shared/xbm8x8-0.1.tar.gz)
md5sums=('5219c706ce39d0fb1aca7649d8e58c2a')

build() {
    mkdir -p $pkgdir/usr/share/icons/sm4tik
    install -m 644 -t $pkgdir/usr/share/icons/sm4tik $srcdir/xbm8x8/*
}
