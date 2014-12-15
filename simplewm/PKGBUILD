# Contributor: projektile

pkgname=simplewm
pkgver=1.0
pkgrel=1
pkgdesc="A small window manager designed for use with wmutils"
arch=('i686' 'x86_64')
url="https://github.com/dcat/swm"
license=('ISC')
depends=('libxcb' 'xcb-proto' 'xproto')
source=(git://github.com/dcat/swm)
sha256sums=('SKIP')

build() {
  cd "${srcdir}"/swm
  make
}

package() {
  cd "${srcdir}"/swm
  install -Dm755 swm "${pkgdir}"/usr/bin/swm
}

