# Maintainer: hbdee <hbdee.arch@gmail.com>

pkgname=reciteword-skins-rw
pkgver=0.8.2
pkgrel=1
pkgdesc="Extra rw skins for ReciteWord."
arch=('any')
url="http://reciteword.sourceforge.net/index_en.html"
license=("GPL")
depends=('reciteword')
source=("http://downloads.sourceforge.net/reciteword/${pkgname}-${pkgver}.tar.bz2"
	"http://downloads.sourceforge.net/reciteword/${pkgver}/${pkgname}_en-${pkgver}.tar.bz2")
md5sums=('c4bd86cfa1031214552967bd9f686e2b'
         'df5ce07c9fcaffe2e12f70a5722db87f')

package() {
  cd ${srcdir}
  mkdir -p ${pkgdir}/usr/share/reciteword/skins
  cp -r rw ${pkgdir}/usr/share/reciteword/skins
  cp -r rw_en ${pkgdir}/usr/share/reciteword/skins
}
