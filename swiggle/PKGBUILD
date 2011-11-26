# Maintainer: kfgz <kfgz at interia pl>
# Contributor: Laszlo Papp <djszapi2 at gmail dot com>

pkgname=swiggle
pkgver=0.4
pkgrel=1
pkgdesc="le's simple web image gallery generator"
arch=('i686' 'x86_64')
url="http://homepage.univie.ac.at/l.ertl/swiggle/"
license=('other')
depends=('libexif' 'libjpeg')
source=(http://homepage.univie.ac.at/l.ertl/swiggle/files/swiggle-0.4.tar.gz)
md5sums=('1df194348898e7fa150d671424c042ad')

build() {
  unset LDFLAGS
  cd "${srcdir}"/${pkgname}-${pkgver}
  make
}

package() {
  install -Dm755 "${srcdir}"/${pkgname}-${pkgver}/${pkgname} "${pkgdir}/"usr/bin/${pkgname}
  install -Dm644 "${srcdir}"/${pkgname}-${pkgver}/README "${pkgdir}/"usr/share/doc/${pkgname}/README
}
