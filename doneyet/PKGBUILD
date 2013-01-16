# Maintainer: TDY <tdy@archlinux.info>

pkgname=doneyet
pkgver=83
pkgrel=1
pkgdesc="A small, filter-based todo list manager"
arch=('i686' 'x86_64')
url="http://doneyet.googlecode.com/"
license=('GPL')
depends=('gcc-libs' 'ncurses')
makedepends=('subversion')
source=(doneyet.1)
md5sums=('0de84a6cca98d6672a14e197b02f3b81')

_svntrunk=http://doneyet.googlecode.com/svn/trunk/
_svnmod=doneyet

build() {
  cd "$srcdir"

  msg "Connecting to $_svnmod.googlecode.com..."
  if [[ -d $_svnmod/.svn ]]; then
    cd $_svnmod && svn up -r $pkgver && cd ..
    msg2 "Local files updated"
  else
    svn co $_svntrunk --config-dir . -r $pkgver $_svnmod
    msg2 "SVN checkout done"
  fi

  rm -rf $_svnmod-build
  svn export $_svnmod $_svnmod-build
  cd $_svnmod-build

  msg "Starting make..."
  make FASTFLAGS="$CFLAGS"
}

package() {
  install -Dm755 "$srcdir/$_svnmod-build/$_svnmod" "$pkgdir/usr/bin/$_svnmod"
  install -Dm644 "$srcdir/$_svnmod.1" "$pkgdir/usr/share/man/man1/$_svnmod.1"
}
