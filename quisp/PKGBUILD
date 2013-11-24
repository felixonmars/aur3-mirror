# Maintainer: perlawk

pkgname=quisp
pkgver=1.28
pkgrel=1
pkgdesc="QUISP (quick server pages) is a simple, complete solution for developing database-driven dynamic web sites."
arch=('i686' 'x86_64')
url="http://quisp.sourceforge.net/sqlman/html/shsql_home.html"
license=("GPL")
conflicts=('shsql')
depends=()
source=("http://quisp.sourceforge.net/download/quisp128.tar.gz")

build() {
  cd "$srcdir"/quisp128/
  make 
}

package() {
  cd "$srcdir"/quisp128
	mkdir -p "$pkgdir"/usr/bin
	mkdir -p "$pkgdir"/usr/lib
	mkdir -p "$pkgdir"/usr/share/man/man1
	cp bin/* "$pkgdir"/usr/bin
	cp lib/* "$pkgdir"/usr/lib
	cp sqlman/manshsql/*.1 qman/manquisp/*.1 "$pkgdir"/usr/share/man/man1
}
md5sums=('e587266af100b46f68550affb900fdc4')
