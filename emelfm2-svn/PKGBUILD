# Maintainer: TDY <tdy@gmx.com>

pkgname=emelfm2-svn
pkgver=2602
pkgrel=1
pkgdesc="A file manager that implements the popular two-pane design"
arch=('i686' 'x86_64')
url="http://emelfm2.net/"
license=('GPL3')
depends=('gtk2')
makedepends=('subversion')
provides=('emelfm2')
conflicts=('emelfm2')

_svntrunk=http://svn.emelfm2.net/trunk
_svnmod=emelfm2

build() {
  cd "$srcdir"

  msg "Connecting to svn.emelfm2.net..."
  if [[ -d $_svnmod/.svn ]]; then
    cd $_svnmod && svn up -r $pkgver && cd ..
    msg2 "Local files updated"
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    msg2 "SVN checkout done"
  fi

  rm -rf $_svnmod-build
  svn export $_svnmod $_svnmod-build
  cd $_svnmod-build

  msg "Starting make..."
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$_svnmod-build"
  make PREFIX="$pkgdir/usr" install{,_i18n}
  ln -sf $_svnmod/${_svnmod}_48.png "$pkgdir/usr/share/pixmaps/$_svnmod.png"
}
