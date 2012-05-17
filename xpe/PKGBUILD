# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Simone Lazzaris <simone@omni.it>

pkgname=xpe
pkgver=0.9.5b
_pkgver=0_9_5b
pkgrel=2
pkgdesc="A graphical editor for Povray based on wxWidgets library"
arch=('i686' 'x86_64')
url="http://nextpe.sourceforge.net/"
license=('GPL')
depends=('wxgtk')
source=("http://downloads.sourceforge.net/nextpe/${pkgname}_project_v${_pkgver}.tar.gz")
md5sums=('3a875f7aa2bc058bd299c1db9aabf067')

build() {
  cd "${srcdir}/${pkgname}_project"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}_project"
  make DESTDIR="${pkgdir}" install

  # Install a desktop entry
  sed -i "7iCategories=Graphics;3DGraphics;" src/xpe.desktop
  install -Dm644 src/bitmaps/hi32-app-xpe.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 src/xpe.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

# vim:set ts=2 sw=2 et:
