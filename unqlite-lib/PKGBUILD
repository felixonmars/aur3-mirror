# Maintainer: Mihai Militaru <mihai militaru at xmpp dot ro>

projname=unqlite
pkgname="$projname"-lib
pkgdate=20130825
pkgver=1.1.6
digitver=${pkgver//./}
pkgrel=2
pkgdesc="An Embeddable NoSQL Database Engine - library"
arch=('i686' 'x86_64')
url="http://unqlite.org/"
license=('custom')
source=(http://unqlite.org/db/"$projname"-db-"$pkgdate"-"$digitver".zip)
md5sums=('a48b7409414cc4a9ff8f7ccce81f40c5')
depends=('glibc')

build() {
  gcc -W -Wall -fPIC -shared -o lib"$projname".so "$projname".c
}

package() {
	mkdir -p "$pkgdir/usr/lib" "$pkgdir/usr/include" "$pkgdir/usr/share/licenses/$pkgname" 
	cp lib"$projname".so "$pkgdir/usr/lib"
	cp "$projname".h "$pkgdir/usr/include"
	cp license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 
}
