# Maintainer: Mihai Militaru <mihai militaru at xmpp dot ro>

projname=unqlite
pkgname="$projname"-doc
pkgver=1.1.6
digitver=${pkgver//./}
pkgrel=1
pkgdesc="An Embeddable NoSQL Database Engine - documentation"
arch=('any')
url="http://unqlite.org/"
license=('custom')
source=(http://unqlite.org/db/"$projname"-docs-"$digitver".zip
		license.txt)
md5sums=('8f7d20ad3dc3e541215032531aec708f'
		'07ce5b07d9883b58ea6025d1a18f615f')

package() {
	mkdir -p "$pkgdir/usr/share/doc/$projname" "$pkgdir/usr/share/licenses/$pkgname"
	
	cp -a * "$pkgdir/usr/share/doc/$projname"
	rm "$pkgdir/usr/share/doc/$projname/$projname-docs-$digitver.zip"
	rm "$pkgdir/usr/share/doc/$projname/license.txt"
	
	cp license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
