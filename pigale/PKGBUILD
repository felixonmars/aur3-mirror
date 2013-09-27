# Maintainer: Fidel Barrera-Cruz <fidel at pacha dot in>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Gaetan Bisson <gaetan.bisson@loria.fr>

pkgname=pigale
pkgver=1.3.14
pkgrel=2
pkgdesc="A graph editor and a C++ algorithm library essentially concerned with planar graphs"
arch=('i686' 'x86_64')
url="http://pigale.sourceforge.net/"
license=('GPL2')
depends=('qt4' 'freeglut')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.png"
        "${pkgname}.desktop"
        "${pkgname}-paths.patch")
sha1sums=('6ed22eab7d54904e3321acbed711318b0721cd3e'
          '9d3279dd4c5b437e57365f6324cda3a9cfbb71bf'
          'bddc8e8201842587be24a243858ed2c693a2b646'
          '3b720209dd88be0be7cfb8deecc99eab082e3305')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Apply patch
  patch -Np1 -i ../${pkgname}-paths.patch

}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"


  ./configure \
      --prefix=/usr/share/${pkgname} \
      --with-qt4=/usr/share/qt \
      QT4=/usr \
      QT_SELECT=4
      
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install data files
  make DESTDIR="${pkgdir}" INSTALL_ROOT="${pkgdir}" install

  # Install binaries and libraries
  mv "${pkgdir}/usr/bin/"{client,pigale-client}
  install -Dm755 qt/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 lib/libtgraph.a "${pkgdir}/usr/lib/libtgraph.a"

  # Install a desktop entry
  install -Dm644 ../${pkgname}.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 ../${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
