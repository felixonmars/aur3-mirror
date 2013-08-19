# Maintainer: Mihai Militaru <mihai militaru at xmpp dot ro>

projname=unqlite
pkgname="$projname"-samples
pkgver=1.1.6
digitver=${pkgver//./}
pkgrel=1
pkgdesc="An Embeddable NoSQL Database Engine - C usage examples"
arch=('i686' 'x86_64')
url="http://unqlite.org/"
license=('custom')
source=(http://unqlite.org/db/"$projname"-samples.zip
		license.txt)
md5sums=('a8de68188d3e70fedbcca16a3d8a6b24'
		'07ce5b07d9883b58ea6025d1a18f615f')
depends=('unqlite-lib')

build() {
  for file in `ls *.c`
    do
      gcc -W -Wall -lunqlite -o ${file//.c/} "$file"
    done
}

package() {
	mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/doc/$pkgname" "$pkgdir/usr/share/licenses/$pkgname"
	
	for file in `ls *.c`
    do
      cp ${file//.c/} "$pkgdir/usr/bin"
      cp "$file" "$pkgdir/usr/share/doc/$pkgname"
    done
    
    cp license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
