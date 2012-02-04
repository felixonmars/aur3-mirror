# Maintainer: Marius Dransfeld <marius.dransfeld@googlemail.com>

pkgname=osgbullet-svn
pkgver=119
pkgrel=1
pkgdesc="osgBullet is a set of software tools for applications that use both OpenSceneGraph and Bullet"
arch=('i686' 'x86_64')
url="http://code.google.com/p/osgbullet/"
license=('LGPL')
groups=()
depends=('osgworks-svn' 'bullet')
makedepends=('subversion' 'cmake')
provides=(osgbullet)
conflicts=(osgbullet)

_svntrunk=http://osgbullet.googlecode.com/svn/trunk/
_svnmod=osgbullet

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD
  #
  cmake . -DCMAKE_BUILD_TYPE=Release  -DCMAKE_INSTALL_PREFIX=/usr

  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir/" install
}
