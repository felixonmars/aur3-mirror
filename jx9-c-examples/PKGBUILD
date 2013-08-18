# Maintainer: Mihai Militaru <mihai militaru at xmpp dot ro>

projname=jx9
pkgname="$projname"-c-examples
pkgver=1.7.2
digitver=${pkgver//./00}
pkgrel=1
pkgdesc="An Embeddable Scripting Engine - C usage examples"
arch=('i686' 'x86_64')
url="http://jx9.symisc.net/"
license=('custom:spl')
source=(http://www.symisc.net/downloads/"$projname"-C-examples.zip
		'http://www.symisc.net/spl.txt')
md5sums=('5cffb1d73aa38e53916dacd782958dd2'
		'7f9004a1cf90cd45310531ec956a0fe0')
depends=('jx9-lib')

build() {
  for file in `ls *.c`
    do
      gcc -W -Wall -ljx9 -o ${file//.c/} "$file"
    done
  
  sed -i 's#<YEAR>#2012, 2013#g' spl.txt
  sed -i 's#<COMPANY NAME>#Symisc Systems#g' spl.txt
  sed -i 's#<PRODUCT_NAME>#JX9 C examples#g' spl.txt
}

package() {
	mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/doc/$pkgname" "$pkgdir/usr/share/licenses/$pkgname"
	
	for file in `ls *.c`
    do
      cp ${file//.c/} "$pkgdir/usr/bin"
      cp "$file" "$pkgdir/usr/share/doc/$pkgname"
    done
    
    cp spl.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
