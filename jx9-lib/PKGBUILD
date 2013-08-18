# Maintainer: Mihai Militaru <mihai militaru at xmpp dot ro>

projname=jx9
pkgname="$projname"-lib
pkgver=1.7.2
digitver=${pkgver//./00}
pkgrel=1
pkgdesc="An Embeddable Scripting Engine - library"
arch=('i686' 'x86_64')
url="http://jx9.symisc.net/"
license=('custom:spl')
source=(http://www.symisc.net/downloads/"$projname"-amalgamation-"$digitver".zip)
md5sums=('a2ea0c904fc1cb48ab3dc5849105425f')
depends=('glibc')
optdepends=('jx9-doc: documentation for the JX9 scripting language and library'
			'jx9-c-examples: examples of using the JX9 embeddable scripting engine')

build() {
  gcc -W -Wall -fPIC -shared -o lib"$projname".so "$projname".c
}

package() {
	mkdir -p "$pkgdir/usr/lib" "$pkgdir/usr/include" "$pkgdir/usr/share/licenses/$pkgname" 
	cp lib"$projname".so "$pkgdir/usr/lib"
	cp "$projname".h "$pkgdir/usr/include"
	cp license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 
}
