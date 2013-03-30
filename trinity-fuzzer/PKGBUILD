# Maintainer: Boohbah <boohbah at gmail.com>

pkgname=trinity-fuzzer
_pkgname=trinity
pkgver=1.1
pkgrel=1
pkgdesc="A Linux System call fuzz tester"
arch=('i686' 'x86_64')
url="http://codemonkey.org.uk/projects/trinity/"
license=('GPL')
conflicts=('trinity-fuzzer-git')
source=("http://codemonkey.org.uk/projects/$_pkgname/$_pkgname-$pkgver.tgz")
md5sums=('7340a4b7a6f0799046f0cf5bf7ec0e7c')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure.sh
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  mkdir -p ${pkgdir}/usr/bin
  cp trinity ${pkgdir}/usr/bin
}

# vim:set ts=2 sw=2 et:
