# Maintainer: Hexchain Tong <i at hexchain.org>

pkgname=deepinwine-qq
pkgver=0.13.4
pkgrel=1
pkgdesc="Tencent QQ 6.7.13458 on CrossOver Deepin"
url="http://im.qq.com/"
license=('Other')
arch=('x86_64' 'i686')
groups=()
depends=(crossover)
install=${pkgname}.install
options=(!strip)
source=("http://packages.linuxdeepin.com/deepin/pool/non-free/d/deepinwine-qq/deepinwine-qq_0.13.4deepin2_i386.deb")


package() {
    cd "$srcdir"
    tar xf data.tar.xz -C "$pkgdir"
}

md5sums=('09aee10abb61e2943d0e033af041512f')
