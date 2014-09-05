# Maintainer: Vorzard

pkgname=sqlite-analyzer
pkgver=3080600
pkgrel=1
pkgdesc="An analysis program for database files compatible with all SQLite versions through 3.8.6 and beyond."
url="http://www.sqlite.org/download.html"
arch=('i686' 'x86_64')
license=('custom')
if [ "$CARCH" = "x86_64" ]; then
depends=('lib32-tcl>=8.6')
else
depends=('tcl>=8.6')
fi
source=("http://www.sqlite.org/2014/sqlite-analyzer-linux-x86-$pkgver.zip")
sha1sums=('afb09ffbeaf06f124db8344f0647a2c6bbc82987')
package() {
  mkdir -p $pkgdir/usr/bin
  install -Dm755 $srcdir/sqlite3_analyzer $pkgdir/usr/bin
  ln -sf sqlite3_analyzer $pkgdir/usr/bin/sqlite_analyzer
}