# Maintainer: Rick Poot < rlpoot at gmail dot com >
# Contributor: Ismael Carnales <icarnales@gmail.com>
pkgname=dzen2-svn
pkgver=271
pkgrel=3
pkgdesc="X notification utility with Xinerama and XMP support, svn version"
arch=('i686' 'x86_64')
url="http://sites.google.com/site/gotmor/dzen"
license=('MIT')
depends=('libxft')
makedepends=('subversion')
provides=('dzen2')
conflicts=('dzen2')

source=()
md5sums=()

_svntrunk=http://dzen.googlecode.com/svn/trunk/
_svnmod=dzen2

build() {
  cd $srcdir

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
  make PREFIX=/usr DESTDIR=$pkgdir install

  #docs
  mkdir -p $pkgdir/usr/share/doc/$_svnmod
  cp README* $pkgdir/usr/share/doc/$_svnmod

  #Licence
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  cp LICENSE $pkgdir/usr/share/licenses/$pkgname/

  #gadgets
  cd gadgets
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 || return 1
  make PREFIX=/usr DESTDIR=$pkgdir install || return 1

  #docs
  cp README* $pkgdir/usr/share/doc/$_svnmod

}

