# Maintainer: Mihai Militaru <mihai militaru at xmpp dot ro>

pkgname=jx9
pkgver=1.7.2
digitver=${pkgver//./00}
pkgrel=1
pkgdesc="An Embeddable Scripting Engine - lib, bin and doc meta package"
arch=('i686' 'x86_64')
url="http://jx9.symisc.net/"
license=('custom:spl')
source=('http://www.symisc.net/spl.txt')
md5sums=('7f9004a1cf90cd45310531ec956a0fe0')
depends=('jx9-lib' 'jx9-c-examples' 'jx9-interp' 'jx9-doc')

build() {
  sed -i 's#<YEAR>#2012, 2013#g' spl.txt
  sed -i 's#<COMPANY NAME>#Symisc Systems#g' spl.txt
  sed -i 's#<PRODUCT_NAME>#JX9#g' spl.txt
}

package() {
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	
	cp spl.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
