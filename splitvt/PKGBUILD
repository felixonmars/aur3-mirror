# Contributor: Ashok Gautham <ScriptDevil.arch@gmail.com>
pkgname=splitvt
pkgver=1.6.6    
pkgrel=1
pkgdesc="This program takes any VT100 terminal window and splits it into two shell windows, one on top and one on bottom."
arch=('i686' 'x86_64')
url="http://slouken.libsdl.org/"
license=('GPL')
depends=() # No non-trivial dependencies afaik
source=($url'/projects/splitvt/splitvt-1.6.6.tar.gz')
md5sums=('ca886884f53c529c149f8945568411ed')
build() {
  cd "$srcdir/$pkgname-$pkgver"

  if [ -f Makefile ]
  then
      rm Makefile
  fi
  ./configure  > /dev/null
  make || return 1
  install -d "$pkgdir/usr/bin"
  cp "$srcdir/$pkgname-$pkgver/splitvt" "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/man/man1"
  gzip "$srcdir/$pkgname-$pkgver/splitvt.man" > "$pkgdir/usr/share/man/man1/splitvt.1.gz"
}

# vim:set ts=2 sw=2 et:
