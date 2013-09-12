# Maintainer: hbdee <hbdee.arch@gmail.com>
# Contributor:figo.zhang <figo1802@gmail.com>

pkgname=reciteword-books
pkgver=0.8.5
pkgrel=1
pkgdesc="Book files for ReciteWord."
arch=('any')
url=("http://reciteword.sourceforge.net/index_en.html")
license=('GPL')
depends=('reciteword')
source=("http://downloads.sourceforge.net/reciteword/${pkgname}-${pkgver}.tar.bz2")
md5sums=('61df064160d38082a23d3ced3deb7184')



package() {
  cd ${srcdir}
  mkdir -p ${pkgdir}/usr/share/reciteword/
  cp -r books ${pkgdir}/usr/share/reciteword/
}

