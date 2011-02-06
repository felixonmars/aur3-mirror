# Maintainer: Fabian Schoelzel <myfirstname.mylastname@googlemail.com>
# Contributor: Jakob Gruber < jakob dot gruber at kabelnet dot at >

pkgname=wesnoth-tinygui
_pkgname=wesnoth
pkgver=1.8
pkgrel=1
pkgdesc="A turn-based strategy game on a fantasy world. Prepared for small portable devices."
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.wesnoth.org/"
depends=('sdl_ttf' 'sdl_net' 'sdl_mixer' 'sdl_image' 'boost' 'python>=2.6' 'pango' 'dbus' 'lua')
makedepends=('imagemagick' 'cmake')
provides=('wesnoth')
conflicts=('wesnoth')
source=(http://downloads.sourceforge.net/sourceforge/$_pkgname/$_pkgname-$pkgver.tar.bz2)

build() {
  cd ${srcdir}/$_pkgname-$pkgver
  mkdir build_$pkgname
  cd build_$pkgname
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_STRICT_COMPILATION=off -DGUI=tiny -DENABLE_LOWMEM=on -DENABLE_SERVER=off -DENABLE_EDITOR=off -DENABLE_TOOLS=off -DENABLE_FRIBIDI=off .. || return 1
  make || return 1
  make DESTDIR=${pkgdir} install
}

md5sums=('07e4b97512e307c54dcfd86659a61e41')
