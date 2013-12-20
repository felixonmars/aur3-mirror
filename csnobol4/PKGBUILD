# Maintainer:  perlawk
pkgname=csnobol4
_pkgname=snobol4
pkgver=1.5
pkgrel=2 
pkgdesc="A port of Macro SNOBOL4 (The original Bell Telephone Labs implementation, written in SIL macros) for machines with 32-bit (or larger) pointers. Supports full SNOBOL4 language plus SPITBOL and other extensions."
url="http://www.snobol4.org/csnobol4/curr/"
arch=('i686' 'x86_64')
license=('GPL')
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=("ftp://ftp.ultimate.com/snobol/snobol4-${pkgver}.tar.gz")

build() {
  cd "$srcdir/${_pkgname}-$pkgver"
  ./configure --prefix=/usr --without-ndbm --force-sdbm --lp64
  make 
}

package() {
  mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/man/man3" "$pkgdir/usr/share/man/man1" \
		"$pkgdir/usr/lib/snobol4/1.4.1"
  cd "$srcdir/${_pkgname}-$pkgver"
	sed -i "s!bin/snobol4-$pkgver!bin/snobol4!" sdb

  install snobol4 sdb "$pkgdir/usr/bin"
	/usr/bin/install -m 644 doc/snobol4.1 "$pkgdir/usr/share/man/man1"
	/usr/bin/install -m 644 doc/snolib.3 "$pkgdir/usr/share/man/man3"
	/usr/bin/install -m 644 doc/snobol4dbm.3 "$pkgdir/usr/share/man/man3"
	/usr/bin/install -m 644 doc/snobol4random.3 "$pkgdir/usr/share/man/man3"
	/usr/bin/install -m 644 doc/snobol4readline.3 "$pkgdir/usr/share/man/man3"
	/usr/bin/install -m 644 doc/snobol4time.3 "$pkgdir/usr/share/man/man3"

	for F in snolib/*.sno include/h.h include/snotypes.h include/macros.h include/load.h include/dt.h config.h equ.h version.h doc/load.txt README host.sno ; do \
		/usr/bin/install -m 644 $F "$pkgdir/usr/lib/snobol4/1.4.1" 
	done

}
md5sums=('54ac3ddd51fb34ec63b1eb0ae7b99794')
