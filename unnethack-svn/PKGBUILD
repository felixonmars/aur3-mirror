# Contributor: Henrik Olsson <henrik@fixme.se>
# Maintainer: Lari Tikkanen <lartza@wippies.com>
pkgname=unnethack-svn
_pkgname=unnethack
pkgver=1542
pkgrel=1
pkgdesc="Variant of NetHack. It features more randomness, more levels, more challenges and more fun than vanilla NetHack."
arch=('i686' 'x86_64')
url="http://sourceforge.net/apps/trac/unnethack/"
license=('custom')
depends=('ncurses' 'glibc')
makedepends=('svn')
conflicts=(unnethack)
source=("$_pkgname::svn://svn.code.sf.net/p/unnethack/code/trunk")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  svnversion | tr -d [A-z]
}

build() {
  cd $srcdir/$_pkgname
  ./configure --bindir=/usr/bin --prefix=/usr/share/unnethack --with-owner=`id -un` --with-group=`id -gn` --enable-wizmode=`id -un` --enable-curses-graphics
  make
}

package () {
  cd $srcdir/$_pkgname
  make DESTDIR="$pkgdir" install
  install -D -m 644 dat/license "$pkgdir/usr/share/licenses/$pkgname/license"
}

