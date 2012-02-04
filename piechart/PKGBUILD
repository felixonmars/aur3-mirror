# Contributor: peter feigl <peter.feigl@jku.at>

pkgname=piechart
pkgver=0.13
pkgrel=1
pkgdesc="An experimental C-program, which can create piecharts in various outputformats using GNU plotutils."
arch=('i686' 'x86_64')
url="http://www.usf.uni-osnabrueck.de/~breiter/tools/piechart/piecharts.en.html"
license=('GPL v2')
depends=('plotutils')
source=(http://www.usf.uni-osnabrueck.de/~breiter/tools/piechart/piechart.c http://www.usf.uni-osnabrueck.de/~breiter/tools/piechart/makefile)

build() {
  cd "${srcdir}"
  sed 's/-ansi-strict/-Wall/' -i makefile
  sed 's/all: piechart test/all: piechart/' -i makefile
  make || return 1
  install -m755 -D piechart ${pkgdir}/usr/bin/piechart
}

md5sums=('925117995260676b77946a475700b29c'
         '26a0322a3a1b38cc0b42aea27c2cf1e6')
