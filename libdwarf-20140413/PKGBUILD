# Maintainer: David Stelter <david.stelter@gmail.com>
# Contributor: Marti Raudsepp <marti@juffo.org>
# Contributor: Alain Kalker <a.c.kalker@gmail.com>

pkgname=libdwarf-20140413
pkgver=20140413
pkgrel=2
pkgdesc="A library for handling DWARF Debugging Information Format, older compat version for hhvm"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
url="http://www.prevanders.net/dwarf.html"
depends=('elfutils')
provides=('libdwarf')
conflicts=('libdwarf')
source=(http://www.prevanders.net/libdwarf-${pkgver}.tar.gz)
sha256sums=('c22272889ed1d3e608b06ce7c568fe0a3fafd0d4f642e41e926fec73365d4eeb')

build() {
  cd "$srcdir"/dwarf-$pkgver
  ./configure --prefix=/usr --enable-shared
  make
}

package() {
  cd "$srcdir"/dwarf-$pkgver/libdwarf

  install -d $pkgdir/usr/lib
  install -m 644 libdwarf.a $pkgdir/usr/lib
  install -m 644 libdwarf.so $pkgdir/usr/lib

  install -d $pkgdir/usr/include/libdwarf
  install dwarf.h libdwarf.h $pkgdir/usr/include/libdwarf

  install -dm 755 $pkgdir/usr/share/doc/$pkgname
  install README NEWS *.pdf $pkgdir/usr/share/doc/$pkgname

  # dwarfdump
  cd "$srcdir"/dwarf-$pkgver/dwarfdump2
  install -Dm755 dwarfdump $pkgdir/usr/bin/dwarfdump
  install -Dm644 dwarfdump.1 $pkgdir/usr/share/man/man1/dwarfdump.1
  install -Dm644 dwarfdump.conf $pkgdir/usr/lib/dwarfdump.conf
}
