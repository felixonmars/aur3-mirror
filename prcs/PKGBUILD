# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Fred Drueck <fdruec1@uic.edu>
pkgname=prcs  
pkgver="1.3.3"
pkgrel=1 
pkgdesc="project revision control system, allegedly simpler than sccs, rcs, and cvs"
arch=('i686' 'x86_64')
url="http://prcs.sourceforge.net/"
license=('GPL')
depends=() # unkown to me
makedepends=(gcc34)
source="http://sourceforge.net/projects/prcs/files/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz"
md5sums=('057a0e243828104d0e672ec1cbf3fea0')


build() {
  # patch so it will build with gcc-34
  cd "$srcdir"
  patch $pkgname-$pkgver/src/rebuild.cc < ../gcc-34.patch
  # choose the old GCC compiler, unset compile flags
  export CC="/usr/bin/gcc-3.4"
  export CFLAGS=""
  export CXX="g++-3.4"
  export CXXFLAGS="$CFLAGS"
  # now configure and build
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --enable-gcc3patch --prefix=/usr 
  make
}

package() {
  cd "$startdir/src/$pkgname-$pkgver"
  make DESTDIR=$startdir/pkg install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
