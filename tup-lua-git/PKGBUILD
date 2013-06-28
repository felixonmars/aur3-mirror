# Maintainer: Anatol Pomozov <anatol dot pomozov at gmail> 

pkgname=tup-lua-git
pkgver=0.6.5.49.ga67c18f
pkgrel=1
pkgdesc="A fast, file-based build system. Lua frontend."
arch=('i686' 'x86_64')
url="http://gittup.org/tup/index.html"
license=('GPL2')
depends=('fuse')
makedepends=('git')
source=('tup::git://github.com/gittup/tup.git#branch=lua')
sha512sums=('SKIP' )

pkgver() {
  cd $srcdir/tup
  git describe | sed 's/^v//;s/-/./g'
}

build() {
  cd $srcdir/tup
  sh bootstrap.sh
}

check() {
  cd $srcdir/tup/test
  ./test.sh
}

package() {
  cd $srcdir/tup

  install -d $pkgdir/usr/bin $pkgdir/usr/share/man/man1
  install -m755 -T tup $pkgdir/usr/bin/tup-lua
  install -m644 -T tup.1 $pkgdir/usr/share/man/man1/tup-lua.1
}
