# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Ray Kohler <ataraxia937 at gmail dot com>

pkgname=xkobo
pkgver=1.11
pkgrel=6
pkgdesc="A multi-directional scrolling shooter game by Akira Higuchi"
arch=('i686' 'x86_64')
url="http://happypenguin.org/show?XKobo"
license=('GPL')
depends=('gcc-libs' 'libxext')
makedepends=('imake')
install="${pkgname}.install"
source=("http://www.ibiblio.org/pub/X11/contrib/games/${pkgname}-${pkgver}.tar.gz"
        "01-modernize.patch"
        "02-${pkgname}.patch"
        "${pkgname}.png"
        "${pkgname}.desktop")
md5sums=('b350678e49ad1a319a73d3e23ba5ec06'
         '95ecd16a58144671fad93c3a481fdb18'
         'e54ba9a249d24a9900afe654f638ce3a'
         'abbcf6053b29a03d86a6e0895d7fc323'
         '5bbbb586146956ed3a1e224ed5670d0a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Apply patches
  patch -Np1 -i "../01-modernize.patch"
  patch -Np0 -i "../02-${pkgname}.patch"

  # Compile
  xmkmf -a
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install game files
  make "DESTDIR=${pkgdir}" install

  # Install pixmap and .desktop file
  install -Dm644 "../${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install man page
  install -Dm644 "${pkgname}.man" "${pkgdir}/usr/share/man/man6/${pkgname}.6"

  # Install documentation
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 CHANGES README* "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim:set ts=2 sw=2 et:
