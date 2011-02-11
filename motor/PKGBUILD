# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Martin Lefebvre <dadexter@gmail.com>
pkgname=motor
pkgver=3.4.0
pkgrel=3
pkgdesc="A text mode based programming environment"
arch=('x86_64' 'i686')
url="http://thekonst.net/motor/"
license=('GPL2')
depends=('ncurses' 'cvs' 'automake' 'autoconf' 'gdb' 'make')
makedepends=('addinclude')
source=("http://thekonst.net/download/$pkgname-$pkgver.tar.bz2"
        "void-compile.patch")
md5sums=('0fcf7ce0386b269e8bdbb7a86e9bee19'
         'b3712050f95092caaa2ec3c826f407e1')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i ../void-compile.patch || return 1
	addinclude -n --top src/debugger/motordebugger.cc "#include <memory>"
	sed -i "s/strndup/strndup_2/" parser/src/strfn.c
	sed -i "s/strndup/strndup_2/" parser/include/strfn.h
	sed -i "s/strndup/strndup_2/" parser/src/parser.c
  ./configure --prefix=/usr --disable-nls || return 1
  make CFLAGS='-g -pg -O1' || return 1
  make prefix=$pkgdir/usr install || return 1 
  install -Dm644 COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/COPYING" || return 1
} 
# vim:set ts=2 sw=2 et:
