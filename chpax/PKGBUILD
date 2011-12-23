# Contributor: DaNiMoTh <jjdanimoth@@@gmail.com>
# Contributor: sh0 <mee@@@sh0.org>

# Fri Dec 23 09:36:57 CET 2011: PKGBUILD cleanup without PKGREL bump.

pkgname='chpax'
pkgver='0.7'
pkgrel=2
pkgdesc='Manages various PaX related flags for ELF32, ELF64, and a.out binaries'
url='http://pax.grsecurity.net/'
arch=('i686' 'x86_64')
license=('GPL')
install="$pkgname.install"
source=("http://pax.grsecurity.net/$pkgname-$pkgver.tar.gz"
	'chpax.install')
sha256sums=('9c6c12d486a0200c3060745dfe56c54ec67a6566499093e71e3f234dfc961c44'
            'd7a54309de7688e98ea31f9851110418885cc07d266ff6a01eebabd25febbb71')

build() {

  cd "$srcdir/$pkgname-$pkgver"
  sed -i -e '/^CFLAGS/s:=:+=:' -e '/TARGET/s:CFLAGS:LDFLAGS:' Makefile
  make

}

package() {
 cd "$srcdir/$pkgname-$pkgver"
 make STRIP='echo' DESTDIR="$pkgdir" install
 chmod 0644 "$pkgdir/usr/share/man/man1/chpax.1"

}

# vim: ft=sh syn=sh
