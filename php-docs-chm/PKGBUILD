# Maintainer: Romain Schmitz <slopjong .at. slopjong .dot. de>

pkgname=php-docs-chm
pkgver=5.x
pkgrel=1
pkgdesc="PHP documentation including the user comments"
arch=('any')
url="http://www.php.net/docs.php"
license=('PHP')
depends=('chmsee')
source=("http://de1.php.net/distributions/manual/php_enhanced_en.chm")
md5sums=('b268b410245464d776fb6fc18411c9ee')

build() {
	:
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  echo "#!/bin/bash" > "$pkgdir/usr/bin/php-docs"
  echo "chmsee /usr/share/doc/php/chm/php_enhanced_en.chm" >> "$pkgdir/usr/bin/php-docs"
  chmod 755 "$pkgdir/usr/bin/php-docs"
  
  mkdir -p "$pkgdir/usr/share/doc/php/chm"
  mv "$startdir"/php_enhanced_en.chm "$pkgdir/usr/share/doc/php/chm"
}
