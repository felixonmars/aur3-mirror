#Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=sdl2-gfx-svn
pkgver=5
pkgrel=1
pkgdesc="SDL2 graphics drawing primitives and other support functions"
arch=('i686' 'x86_64')
url="http://www.ferzkopp.net/joomla/software-mainmenu-14/4-ferzkopps-linux-software/19-sdlgfx"
license=('MIT')
depends=(sdl2)
provides=(sdl2_image)
options=(!libtool)

source=('sdl2-gfx::svn://svn.code.sf.net/p/sdl2gfx/code/trunk')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/sdl2-gfx"
  svnversion | tr -d [A-z]
}

build() {
  cd "${srcdir}/sdl2-gfx"

  ./autogen.sh
  ./configure --disable-static --prefix=/usr
  make
}

package() {
  cd "${srcdir}/sdl2-gfx"
  make DESTDIR="${pkgdir}/" install
}
## vim:set ts=2 sw=2 et:
