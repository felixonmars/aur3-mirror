pkgname=javapp
pkgver=0.4
pkgrel=1
pkgdesc="Java preprocessor"
arch=(any)
url="http://www.slashdev.ca/javapp"
license=("GPL")
depends=(java-environment)
makedepends=(dos2unix)
source=("http://www.slashdev.ca/download/javapp-$pkgver.zip")
md5sums=('c27580ce2f347f54d126d4131ed3f6fe')

build() {
	cd $srcdir
	find . -type f -exec dos2unix {} \;
}
         
package() {
  install -Dm644 "$srcdir/javapp.jar" "$pkgdir/usr/share/java/javapp.jar"
  install -Dm644 "$srcdir/COPYING" "$pkgdir/usr/share/licenses/javapp/COPYING"
}

# vim:set ts=2 sw=2 et:
