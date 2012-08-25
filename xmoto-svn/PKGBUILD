# Maintainer: jsteel <mail at jsteel dot org>
# Contributor: Stefan Wilkens <stefanwilkens@gmail.com>
# Contributor: Simon Lackerbauer <calypso "at" strpg.org>

pkgname=xmoto-svn
pkgver=3413
pkgrel=1
pkgdesc="A challenging 2D motocross platform game, where physics play an important role in gameplay. Developement version"
arch=('i686' 'x86_64')
url="http://xmoto.tuxfamily.org"
license=('GPL')
depends=('curl' 'libjpeg' 'libpng' 'libxdg-basedir' 'libxml2' 'lua' 'mesa'
         'ode' 'sdl_mixer' 'sdl_net' 'sdl_ttf' 'sqlite3')
makedepends=('libxml++' 'subversion')
conflicts=('xmoto')
provides=('xmoto')
_svntrunk=svn://svn.tuxfamily.org/svnroot/xmoto/xmoto/trunk
_svnmod=xmoto

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    cd $_svnmod
    svn update
  else
    svn co $_svntrunk --config-dir ./ $_svnmod
    cd $_svnmod
  fi

  # fix to work with gcc 4.7
  sed -e '/#include <vector>/ a\#include <unistd.h>' -i src/helpers/System.h

  ./bootstrap

  ./configure --prefix=/usr

  make
}

package() {
  cd "$srcdir"/$_svnmod

  make DESTDIR="$pkgdir" mangdir=/usr/man/man6 install

  install -Dm644 "$srcdir"/xmoto/extra/xmoto.desktop "$pkgdir"/usr/share/applications/xmoto.desktop
  install -Dm644 "$srcdir"/xmoto/extra/xmoto.xpm "$pkgdir"/usr/share/pixmaps/xmoto.xpm
}
