# Maintainer: Mihai Militaru <mihai militaru at xmpp dot ro>

projname=unqlite
pkgname="$projname"-interp
pkgver=1.1.6
digitver=${pkgver//./}
pkgrel=1
pkgdesc="An Embeddable NoSQL Database Engine - interpreter and example scripts"
arch=('i686' 'x86_64')
url="http://unqlite.org/"
license=('custom')
source=(http://unqlite.org/db/"$projname"-jx9-src.zip
		license.txt)
md5sums=('743fbf8f61e6647a9d25a13c25a605be'
		'07ce5b07d9883b58ea6025d1a18f615f')
depends=('unqlite-lib')

build() {
  gcc -W -Wall -l"$projname" -o "$projname" "$projname"_jx9_interp.c
}

package() {
	mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/doc/$pkgname/" "$pkgdir/usr/share/licenses/$pkgname"
	cp "$projname" "$pkgdir/usr/bin"
	cp -a scripts "$pkgdir/usr/share/doc/$pkgname/"
	
	cp license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
