# Maintainer: Kin <kurisui at gmail dot com>
pkgname=znc-colloquy
pkgver=1838
pkgrel=1
pkgdesc="ZNC module to push IRC messages and highlights to your iphone via colloquy"
arch=(i686 x86_64)
url=http://github.com/wired/colloquypush/tree/master/znc/
license=(GPL)
depends=(gcc-libs perl openssl c-ares tcl znc)
makedepends=(perl openssl gcc pkgconfig tcl znc)
source=('http://github.com/wired/colloquypush/raw/master/znc/colloquy.cpp')
md5sums=('c180602f0e77ed59de025a673fed29e0')

build() {

 znc-buildmod colloquy.cpp || return 1
 mkdir -p $pkgdir/usr/lib/znc || return 1
 mv *.so $pkgdir/usr/lib/znc || return 1

}

