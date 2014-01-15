pkgname=onyx
pkgver=5.1.2
pkgrel=3

pkgdesc="Onyx is a powerful stack-based, multi-threaded, interpreted, general purpose programming language similar to PostScript. It can be embedded as an extension language similarly to ficl (Forth), guile (scheme), librep (lisp dialect), s-lang, Lua, and Tcl."

url='http://www.canonware.com/onyx/'

arch=('i686' 'x86_64')
license=('custom: relaxed FreeBSD license')
depends=('pcre' 'libedit')
makedepends=('cook')
source=("http://www.canonware.com/download/onyx/${pkgname}-${pkgver}.tar.bz2"
        "LICENSE")
md5sums=('1c465afe358593357d9271d787850dea'
         '82a0b905d22692082ce3066b7ea9c532')


build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  cook LDFLAGS="-ldl -lm"
}

package() {
  cd $srcdir/$pkgname-$pkgver
  cook install LDFLAGS="-ldl -lm"               \
               PREFIX="${pkgdir}/usr"           \
               LIBDIR="${pkgdir}/usr/lib"       \
               MANDIR="${pkgdir}/usr/share/man" 
  install -Dm644 $startdir/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
