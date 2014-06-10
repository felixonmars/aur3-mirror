# Maintainer: David Adler <david dot jo dot adler at gmail dot com>
pkgname=inconcert-git
pkgver=20100208.r0.gca134f1
pkgrel=1
pkgdesc='tap tempo adjustment for JACK'
arch=('i686' 'x86_64')
url="http://www.teuton.org/~gabriel/InConcert/"
license=('GPL')
depends=('jack' 'qt4')
provides=('inconcert')
conflicts=('inconcert')
makedepends=('qconf' 'git')
source=('inconcert::git://gabe.is-a-geek.org/git/inconcert.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/inconcert"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/inconcert"
  qmake-qt4
  make
}

package() {
  cd "$srcdir/inconcert"
  install -m755 -d $pkgdir/usr/bin
  install -D -m755 src/inconcert "${pkgdir}/usr/bin/"
}

# vim:set ts=2 sw=2 et:
