# Maintainer: Jack Frost <fbt@fleshless.org>

pkgname='zpac'
pkgdesc='A simple AUR/ABS downloader.'
license=( 'ISC' )
pkgver=2.8
pkgrel=1
arch=( 'any' )
url='https://github.com/fbt/zpm'

depends=( 'subversion' 'curl' 'bash' 'jshon' )

source=( "https://github.com/fbt/zpac/archive/v${pkgver}.zip" )

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 zpac "${pkgdir}/usr/bin/zpac"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha1sums=('dcffcb0fe9499d4c7c2e587ce805928545125396')
