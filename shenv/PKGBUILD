# Maintainer: Sathyam Vellal <mail@sathyamvellal.in>

pkgname=shenv
pkgver=1.1
pkgrel=1
pkgdesc='A set of scripts to create custom shell environments, based on folders'
arch=('any')
url='http://sathyamvellal.in/shenv'
license=('MIT')
depends=()
makedepends=()
install=shenv.install
source=("https://github.com/sathyamvellal/shenv/archive/shenv-${pkgver}.tar.gz")
md5sums=('6b6135c739d91628c4e1a76edf0f38dc')

package() {
	mkdir $pkgdir/usr/share/$pkgname -p
	cp $srcdir/shenv-shenv-$pkgver/* $pkgdir/usr/share/$pkgname/ -r 
}
