# Contributor: aeolist <aeolist@hotmail.com>
# Maintainer: Filip Wojciechowski, filip at loka dot pl

pkgname=dzen2-gadgets-svn
pkgver=267
pkgrel=1
pkgdesc="X notification utility with gadgets like gdbar, svn edition featuring gcpubar"
arch=('i686' 'x86_64')
url="http://dzen.geekmode.org"
license=('MIT')
depends=('libxpm' 'libxinerama')
makedepends=('gcc' 'subversion')
provides=('dzen2')
conflicts=('dzen2' 'dzen2-gadgets')
source=('config.mk.1' 'config.mk.2')
md5sums=('ee2b691bcafce0f6076218b786b8e1fc'
         '961ac1fe90e9be474c3f65f3eea35960')

_svntrunk=http://dzen.googlecode.com/svn/trunk/
_svnmod=dzen

build() {
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod 
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd $startdir/src/dzen
  cp $startdir/src/config.mk.1 $startdir/src/dzen/config.mk || return 1
  cp $startdir/src/config.mk.2 $startdir/src/dzen/gadgets/config.mk || return 1

  make DESTDIR=$startdir/pkg install || return 1
  install -m644 -D LICENSE $startdir/pkg/usr/share/licenses/$pkgname/COPYING

  cd $startdir/src/dzen/gadgets
  make DESTDIR=$startdir/pkg install || return 1
}

