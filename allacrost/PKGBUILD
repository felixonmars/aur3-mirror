# Contributor: Jakob Gruber <jakob.gruber@gmail.com>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=allacrost
pkgver=20110717
_pkgver=0.1.0
pkgrel=1
pkgdesc='A single player 2D role-playing game inspired by classic console RPGs'
arch=('i686' 'x86_64')
url='http://www.allacrost.org/'
license=('GPL2')
depends=('libgl' 'mesa' 'qt' 'openal' 'libvorbis' 'sdl_net' 'sdl_ttf' 'luabind')
makedepends=('boost')
options=('!emptydirs')
source=("http://downloads.sourceforge.net/project/${pkgname}/development releases/${pkgname}_development_source_${pkgver}.tar.gz")
md5sums=('dbc17a9af7a912ecdf4e146f3e9ee5c3')

build() {

  cd "${srcdir}/${pkgname}-${_pkgver}"

  ./configure --prefix=/usr

  sed -i 's|bindir = ${prefix}/games|bindir = ${prefix}/bin|' Makefile
  sed -i 's|datarootdir = ${prefix}/share/games|datarootdir = ${prefix}/share|' Makefile

  make DESTDIR="${pkgdir}" install

}
