# Contributor: Jakob Gruber <jakob.gruber@gmail.com>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=allacrost
pkgver=20110717
_pkgver=0.1.0
pkgrel=4
pkgdesc='single player 2D role-playing game inspired by classic console RPGs'
arch=('i686' 'x86_64')
url='http://www.allacrost.org/'
license=('GPL2')
depends=('libgl' 'mesa' 'qt4' 'openal' 'libvorbis' 'sdl_net' 'sdl_ttf' 'luabind')
makedepends=('boost')
options=('!emptydirs')
source=('allacrost.desktop'
        'allacrost.png'
        "http://downloads.sourceforge.net/project/${pkgname}/development%20releases/${pkgname}_development_source_${pkgver}.tar.gz")
md5sums=('2bb08a82904ddf16187903e3e13e506e'
         'ace6fc72f9b9cf68a8ab2a11975b1746'
         'dbc17a9af7a912ecdf4e146f3e9ee5c3')


prepare() {
  cd "${srcdir}/${pkgname}-${_pkgver}"

  sed -i 's|bindir = ${prefix}/games|bindir = ${prefix}/bin|' Makefile
  sed -i 's|datarootdir = ${prefix}/share/games|datarootdir = ${prefix}/share|' Makefile
}

build() {
  cd "${srcdir}/${pkgname}-${_pkgver}"

  ./configure --prefix=/usr
}

package() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  make DESTDIR="${pkgdir}" install

  install -Dm 644 "${srcdir}"/allacrost.png "${pkgdir}"/usr/share/pixmaps/allacrost.png
  install -Dm 644 "${srcdir}"/allacrost.desktop "${pkgdir}"/usr/share/applications/allacrost.desktop
}
