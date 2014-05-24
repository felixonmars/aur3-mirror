# Contributor: Calimero <calimeroteknik@free.fr>
pkgname=qrun
pkgver=0.50
pkgrel=3
pkgdesc="A tiny program runner written in Qt"
arch=('i686' 'x86_64')
url="ftp://arcaik.toile-libre.org"
license=('GPL3')
depends=('qt4')
#broken source=(ftp://arcaik.toile-libre.org/QRun/QRun-${pkgver}.tar.gz)
source=(http://calimeroteknik.free.fr/src/QRun-${pkgver}.tar.gz)
md5sums=('15fdb282b9249acfd0ab1ff3e0b93dc7')

build() {
  cd "$srcdir"/QRun
  qmake-qt4
  make
}
package() {
  cd "$srcdir"/QRun
  install -D -m755 QRun "$pkgdir"/usr/bin/qrun
}
