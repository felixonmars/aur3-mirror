# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Maintainer: lh <jarryson@gmail.com>
# Maintainer: Nathan O <ndowens.aur at gmail dot com>

pkgname=egear
pkgver=0.1.1.1
pkgrel=4
pkgdesc="A download tool written in Qt 4"
arch=('i686' 'x86_64')
url="http://egear.googlecode.com/"
license=('GPL3')
depends=('qt' 'python' 'curl')
options=('!libtool')
source=(http://${pkgname}.googlecode.com/files/${pkgname}-${pkgver}.tar.gz \
  ${pkgname}.patch)
md5sums=('3b52743b3c68b7065377f6513733d835'
         '7a7eb4559a9c9f73f154bd62f00b10da')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  patch -p0 -i ../${pkgname}.patch 
  qmake
  make 
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 misc/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -Dm644 res/${pkgname}.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
}
