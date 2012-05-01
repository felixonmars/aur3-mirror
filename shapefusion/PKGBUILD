# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: rabyte <rabyte__gmail>

pkgname=shapefusion
pkgver=0.6
pkgrel=1
pkgdesc="A scenario editor for the AlephOne game engine"
arch=('i686' 'x86_64')
url="http://shapefusion.sourceforge.net/"
license=('GPL')
depends=('libsndfile' 'wxgtk')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tgz"
        "${pkgname}.png"
        "${pkgname}.desktop")
md5sums=('eb56312d3b186028d679b9b49caf8158'
         '88fa7fdceb9f20e4157c0e8f1e1d10a4'
         '24685ec2bb19ea2b1df6948fec44c4b7')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # Install a desktop entry
  install -Dm644 "../${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install a readme file
  install -Dm644 README.txt "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim:set ts=2 sw=2 et:
