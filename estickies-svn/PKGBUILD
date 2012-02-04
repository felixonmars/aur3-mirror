# Contributor: BinkyTheClown <binky_at_archlinux_dot_us>

pkgname=estickies-svn
pkgver=43316
pkgrel=2
pkgdesc="Estickies is a sticky notes application that uses Etk."
arch=('i686' 'x86_64')
makedepends=('subversion' 'elementary-svn')
depends=('elementary-svn')
license=('BSD')
url="http://www.enlightenment.org"

_svntrunk=http://svn.enlightenment.org/svn/e/trunk/estickies
_svnmod=estickies

build() {

  cd $srcdir

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  ./autogen.sh --prefix=/usr
  make || return 1
  make DESTDIR=${pkgdir} install || return 1

  install -Dm644 $srcdir/$_svnmod-build/COPYING \
    $pkgdir/usr/share/licenses/$pkgname/COPYING
  
  install -Dm644 $srcdir/$_svnmod-build/COPYING-PLAIN \
    $pkgdir/usr/share/licenses/$pkgname/COPYING-PLAIN
  
  rm -rf $srcdir/$_svnmod-build
}
