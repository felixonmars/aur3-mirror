# Maintainer: Mihai Militaru <mihai militaru at xmpp dot ro>

projname=jx9
pkgname="$projname"-doc
pkgver=1.7.2
digitver=${pkgver//./00}
pkgrel=1
pkgdesc="An Embeddable Scripting Engine - documentation"
arch=('any')
url="http://jx9.symisc.net/"
license=('custom:spl')
source=(http://www.symisc.net/downloads/"$projname"-docs-"$digitver".zip
		'http://www.symisc.net/spl.txt')
md5sums=('e770f2a54b5198e655af11073ddfa133'
		'7f9004a1cf90cd45310531ec956a0fe0')

build() {
  sed -i 's#<YEAR>#2012, 2013#g' spl.txt
  sed -i 's#<COMPANY NAME>#Symisc Systems#g' spl.txt
  sed -i 's#<PRODUCT_NAME>#JX9 documentation#g' spl.txt
}

package() {
	mkdir -p "$pkgdir/usr/share/doc/$projname" "$pkgdir/usr/share/licenses/$pkgname"
	
	cp -a * "$pkgdir/usr/share/doc/$projname"
	rm "$pkgdir/usr/share/doc/$projname/$projname-docs-$digitver.zip"
	
	cp spl.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
