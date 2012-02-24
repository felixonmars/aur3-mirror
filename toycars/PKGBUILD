# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Dany Martineau <dany.luc.martineau gmail.com>

pkgname=toycars
pkgver=0.3.10
pkgrel=2
pkgdesc="A top down physics based car racing game"
arch=('i686' 'x86_64')
url="http://toycars.sourceforge.net/"
license=('BSD')
depends=('fltk' 'fmodex' 'libgl' 'sdl_image')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-constchar.patch"
        "${pkgname}-list.patch"
        "${pkgname}-include.patch"
        "${pkgname}.desktop"
        "${pkgname}_vehicle_editor.desktop"
        "${pkgname}_track_editor.desktop")
md5sums=('6b0b7506ee5623081e002c8690c5bc78'
         '6b44bd1b71418aff83ce72e90aff25d3'
         '8e6ed06b8b8641b95281caced8a964b8'
         '318ece4df8ad02f5269117a97df464c0'
         'ac2273eff6078aff5228f5dc3baa1616'
         '4aeb5e54bad4928c7b5f818a0f39312d'
         '93f6110458d9d5a047dd234161354ace')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Fix name of track file corner.map
  mv data/tracks/Corner/{corner,Corner}.map

  # Apply patches
  patch -Np0 -i "../${pkgname}-constchar.patch"
  patch -Np0 -i "../${pkgname}-list.patch"
  patch -Np1 -i "../${pkgname}-include.patch"

  # Patches 'constchar' and 'list' were downloaded from:
  # http://sourceforge.net/tracker/?func=detail&aid=3288921&group_id=143140&atid=759875
  # http://sourceforge.net/tracker/?func=detail&aid=3288922&group_id=143140&atid=759875

  # Compile
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install game files
  make DESTDIR="${pkgdir}" install

  # Install .desktop files and pixmap
  mkdir -p "${pkgdir}/usr/share/applications"
  install -Dm644 ../*.desktop "${pkgdir}/usr/share/applications"
  install -Dm644 toycars/celica-render.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  # Install license
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
