# Maintainer: Aurélien Chabot <aurelien at chabot dot fr>

pkgname=castnow
pkgver=0.4.13
pkgrel=1
pkgdesc="A commandline chromecast player"
arch=('any')
makedepends=('git')
url="https://github.com/xat/castnow"
license=('MIT')
depends=('nodejs')
source=($pkgname::git://github.com/xat/castnow.git#commit=cc65762711b6bad73ab9eb1d2a87015bed826e26)
md5sums=(SKIP)

package() {
	cd $pkgname
	mkdir -p $pkgdir/usr
	npm install --user root -g --prefix="$pkgdir/usr"
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
