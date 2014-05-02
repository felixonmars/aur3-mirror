# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=tuxfootball-git
pkgver=140.32008b5
pkgrel=1
pkgdesc="Arcade-style 2D football game very reminiscent of Sensible Soccer and Kick Off."
arch=('i686' 'x86_64')
url="http://tuxfootball.sourceforge.net/"
license=('GPL2')
depends=('hicolor-icon-theme' 'sdl2_image' 'sdl2_mixer')
makedepends=('cmake')
conflicts=('tuxfootball')
source=('git+git://git.code.sf.net/p/tuxfootball/code')
md5sums=('SKIP')

prepare() {
  cd $srcdir/code
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  
  # Full screen mode(-w for windowed mode)
  sed -i "s|Exec=tuxfootball|Exec=tuxfootball -f|" tuxfootball.desktop
}

package() {
  cd $srcdir/code
  make DESTDIR=$pkgdir install
}

pkgver() {
  cd $srcdir/code
  echo $(git rev-list --count master).$(git rev-parse --short master)
}