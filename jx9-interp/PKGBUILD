# Maintainer: Mihai Militaru <mihai militaru at xmpp dot ro>

projname=jx9
pkgname="$projname"-interp
pkgver=1.7.2
digitver=${pkgver//./00}
pkgrel=1
pkgdesc="An Embeddable Scripting Engine - interpreter and example scripts"
arch=('i686' 'x86_64')
url="http://jx9.symisc.net/"
license=('custom:spl')
source=(http://www.symisc.net/downloads/"$projname"-interpreter-src.zip
		'http://www.symisc.net/spl.txt')
md5sums=('640eebb35d3cd8aefa7bb7347d1501f4'
		'7f9004a1cf90cd45310531ec956a0fe0')
depends=('jx9-lib')

build() {
  gcc -W -Wall -l"$projname" -o "$projname" "$projname"_interp.c
  
  sed -i 's#<YEAR>#2012, 2013#g' spl.txt
  sed -i 's#<COMPANY NAME>#Symisc Systems#g' spl.txt
  sed -i 's#<PRODUCT_NAME>#JX9 interpreter and scripts#g' spl.txt
}

package() {
	mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/doc/$pkgname/" "$pkgdir/usr/share/licenses/$pkgname"
	cp "$projname" "$pkgdir/usr/bin"
	cp -a scripts "$pkgdir/usr/share/doc/$pkgname/"
	
	cp spl.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
