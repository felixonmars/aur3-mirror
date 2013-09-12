# Maintainer: hbdee <hbdee.arch@gmail.com>
# Contributor:figo.zhang <figo1802@gmail.com>

pkgname=reciteword-dicts
pkgver=0.8.2
pkgrel=1
epoch=1
pkgdesc="Dictionary files for ReciteWord"
arch=('any')
url="http://reciteword.sourceforge.net/index_en.html"
license=('GPL')
depends=('reciteword')
source=("http://downloads.sourceforge.net/reciteword/${pkgname}-${pkgver}.tar.bz2")
md5sums=('f41d9dd162c4360924cfedb5cce3e5af')

package() {
  cd ${srcdir}
  mkdir -p ${pkgdir}/usr/share/reciteword/
  cp -r dicts ${pkgdir}/usr/share/reciteword/
}