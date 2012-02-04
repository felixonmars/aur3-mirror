# Maintainer: Alexander Rødseth <rodseth@gmail.com>
pkgname=hubbub-svn
pkgver=12160
pkgrel=1
pkgdesc="An HTML5 compliant parsing library"
arch=('x86_64' 'i686')
url="http://www.netsurf-browser.org/projects/hubbub/"
license=('MIT')
depends=('libparserutils')
makedepends=('subversion')
provides=('hubbub')
_svntrunk=svn://svn.netsurf-browser.org/trunk/hubbub
_svnmod=hubbub

build() {
  cd "$srcdir"
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  msg "SVN checkout done or server timeout"

  cd $_svnmod
  msg2 "Compiling..."
  export CFLAGS="-Wno-unused-but-set-variable"
  make
}

package() {
  cd "$srcdir/$_svnmod"

  make PREFIX="/usr" DESTDIR="$pkgdir/" install
  msg2 "Packaging license..."
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
