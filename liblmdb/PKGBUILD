# Maintainer:  Matt Monaco <cx monaco matt>

pkgname=liblmdb
pkgver=0.9.14
_commit=2f587ae081d076e3707360c5db086520c219d3ea
pkgrel=2
pkgdesc="Symas Lightning Memory-Mapped Database"
url="http://symas.com/mdb"
license=(custom:OpenLDAP)
arch=(x86_64 i686)
source=(
	git+https://github.com/LMDB/lmdb.git#commit=$_commit
	)
sha256sums=(
	SKIP
	)
makedepends=(git)
options=(strip debug)

build()
{
	cd "$srcdir/lmdb/libraries/$pkgname"
	make prefix=/usr
}

package()
{
	cd "$srcdir/lmdb/libraries/$pkgname"
	install -m755 -d "$pkgdir"/usr/{bin,lib,include,man/man1}
	make DESTDIR="$pkgdir" prefix=/usr install
	install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/OpenLDAP"
}

# vim: set noet :
