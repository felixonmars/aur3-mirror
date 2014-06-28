# Maintainer: 404
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>

_name=blinkensisters
pkgname=$_name-svn
pkgver=r1084
pkgrel=1
pkgdesc="Open source jump'n'run game in 80s retro style (aka 'Hunt for The Lost Pixels', development version)"
arch=('i686' 'x86_64')
url="http://blinkensisters.at"
license=('GPL2')
depends=('sdl_mixer' 'sdl_image' 'sdl_net' 'sdl_ttf' 'libtheora')
makedepends=('cmake')
provides=("$_name")
conflicts=("$_name")
source=($_name::"svn+http://svn.code.sf.net/p/blinkensisters/code")
md5sums=('SKIP')

pkgver() {
  cd $_name
  local _ver="$(svnversion)"
  printf "r%s" "${_ver//[[:alpha:]]}"
}

build() {
  cd $_name

  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr -DUSE_THEORA=YES
  make
}

package() {
  make -C $_name DESTDIR="$pkgdir" install
}
