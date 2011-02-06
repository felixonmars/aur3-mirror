# Contributor: Friedrich Weber <fred@reichbier.de>
pkgname=libsgml
pkgver=1.1.4
pkgrel=1
pkgdesc="SGML parsing library."
arch=("i686")
url="http://www.hick.org/code.html"
license=('custom')
depends=('gcc-libs')
md5sums=('a3ba2f8c19faf1a53182d9c6fab22e58'
         '464719721ed7c6ee0d3703046212fd47')
install=
source=(http://www.hick.org/code/skape/libsgml/$pkgname-$pkgver.tar.gz
        Makefile.in.patch)
         
build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg "Patching Makefile.in ..."
  patch -p1 -i ../Makefile.in.patch || return 1

  ./configure --prefix=/usr

  make || return 1

  mkdir -p $pkgdir/usr/include/sgml \
           $pkgdir/usr/lib

  make DESTDIR="$pkgdir" install || return 1 
  install -Dm 644 License $pkgdir/usr/share/licenses/${pkgname}/license.txt || return 1
}

# vim:set ts=2 sw=2 et:
