# Maintainer: Stunts <f.pinamartins@gmail.com>

pkgname=sambada
pkgver=0.4.2
pkgrel=1
pkgdesc="Detect associations between gentic data and environment variables"
arch=('i686' 'x86_64')
url="http://http://lasig.epfl.ch/sambada"
license=('GPL3')
depends=('')
source=("http://lasig.epfl.ch/files/content/sites/lasig/files/src-${pkgname}-v${pkgver}.zip")
md5sums=('7bfc0900c40441f142336118b1a11cc7')

build() {
  cd ${srcdir}/src-sambada-v${pkgver}
  make
}

package() {
  install -D ${srcdir}/src-sambada-v${pkgver}/binaries/Sambada-v${pkgver} $pkgdir/usr/bin/${pkgname}
  install -D ${srcdir}/src-sambada-v${pkgver}/binaries/Supervision-v${pkgver} $pkgdir/usr/bin/supervision
  install -D ${srcdir}/src-sambada-v${pkgver}/binaries/RecodePlink-v${pkgver} $pkgdir/usr/bin/RecodePlink
  install -D ${srcdir}/src-sambada-v${pkgver}/binaries/RecodePlink_LFMM-v${pkgver} $pkgdir/usr/bin/RecodePlink_LFMM
}
