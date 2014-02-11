# Contributor: Ben R <thebenj88 *AT* gmail *DOT* com>

pkgname=left4gore
pkgver=2.3
pkgrel=2
pkgdesc="Tool to uncensor Australian/German versions of Left 4 Dead 2"
arch=('i686' 'x86_64')
url="http://www.left4gore.com/"
license=('custom')
install=$pkgname.install
depends=('steam' 'lib32-glibc')
[[ $CARCH == i686 ]] && depends=(${depends[@]/lib32-/})
source=(http://www.left4gore.com/dist/$pkgname-$pkgver-linux.tar.gz
		$pkgname.desktop)
sha1sums=('a947638a66cfa3460e66c880cfee2a557598d1af'
          'ae2842b3b585c4a1a5f8d9c780f841ff06df61b9')
  
package() {
	cd "$srcdir/$pkgname-$pkgver-linux"
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm644 README.linux.txt "$pkgdir/usr/share/$pkgname/README"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}


