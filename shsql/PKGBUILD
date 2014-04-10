# Maintainer: perlawk

pkgname=shsql
pkgver=1.28
pkgrel=2
pkgdesc="SHSQL is a standalone SQL database that stores data in ascii text files."
arch=('i686' 'x86_64')
url="http://quisp.sourceforge.net/shsqlhome.html"
license=("GPL")
conflicts=('quisp')
makedepends=('rpmextract')
depends=()
options=('staticlibs')
source=("http://ftp5.gwdg.de/pub/opensuse/repositories/home:/zhonghuaren/Fedora_20/src/shsql-1.28-3.2.src.rpm")

prepare() {
	rpmextract.sh "$srcdir"/$pkgname-$pkgver-3.2.src.rpm	
	tar xf quisp128.tar.gz
}

build() {
  cd "$srcdir"/quisp128/sqlsrc
  make 
}

package() {
  cd "$srcdir"/quisp128
	mkdir -p "$pkgdir"/usr/bin
	mkdir -p "$pkgdir"/usr/lib
	mkdir -p "$pkgdir"/usr/share/man/man1
	cp bin/* "$pkgdir"/usr/bin
	cp lib/* "$pkgdir"/usr/lib
	cp sqlman/manshsql/*.1 "$pkgdir"/usr/share/man/man1
}
md5sums=('5f69db4b5b20217d96a8b3a13aab9849')
