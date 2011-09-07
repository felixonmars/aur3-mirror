# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>
pkgname=upset-qt
pkgver=04
pkgrel=2
pkgdesc="A tool to create and apply UPS patches"
arch=('i686' 'x86_64')
url="http://byuu.org/programming/"
license=('unknown')
depends=('qt')
provides=('upset')
conflicts=('upset')
source=(http://byuu.org/files/upset_v04.tar.bz2)
md5sums=('20a05d2b6855b36ce973bf2bfb30a8b0')

build() {
  cd "$srcdir/upset"

  sed -i -e 's#g++-4.5#g++#g' ./cc-qt.sh
  ./cc-qt.sh
}

package() {
  cd "$srcdir/upset"

  install -D -m755 ./upset "$pkgdir/usr/bin/upset"
}
