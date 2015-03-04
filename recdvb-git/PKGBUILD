# Maintainer: Benjamin M. <benmoran56@gmail.com>
pkgname=recdvb-git
pkgver=1.2.0
pkgrel=2
pkgdesc='Simple command-line utility to record DVB streams.'
arch=('any')
url='http://github.com/inn1983/recdvb'
license=('GPL3')
makedepends=('git')
optdepends=('libarib25: b25 decoding support. Must rebuild package after installing.')
provides=('recdvb')
source=('git://github.com/inn1983/recdvb.git')
md5sums=('SKIP')

build() {
  cd "$srcdir/$provides"
  ./autogen.sh
  ./configure --enable-b25
  make
}

package() {
  cd "$srcdir/$provides"
  install -D -m0755 recdvb "$pkgdir/usr/bin/recdvb"
  install -D -m0755 recdvbctl "$pkgdir/usr/bin/recdvbctl"
}


