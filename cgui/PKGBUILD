# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=cgui
pkgver=2.0.3
pkgrel=1
pkgdesc="A library for making graphical user interfaces"
arch=('i686' 'x86_64')
url="http://cgui.sourceforge.net/"
license=('custom')
depends=('allegro4')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "LICENSE")
md5sums=('60e4fc939f9fb9fd332f8b405e2f11ab'
         'c2ce5f4da7bd9ee73ae2b37418d5b6dd')

build() {
  cd "${srcdir}/${pkgname}"
  ./fix.sh unix
  make || return 1
}

package() {
  cd "${srcdir}/${pkgname}"
  make SYSTEM_DIR="${pkgdir}/usr" install || return 1
  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
