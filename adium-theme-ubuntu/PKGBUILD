# Maintainer: Vinicius de Avila Jorge <vinicius.avila.jorge@gmail.com>
# Contributor: Joel Almeida <aullidolunar at gmail dot c0m>

pkgname=adium-theme-ubuntu
pkgver=0.3.4
pkgrel=1
pkgdesc="Adium message style for Ubuntu"
arch=('any')
url="https://launchpad.net/adium-theme-ubuntu"
license=('BSD' 'custom:AFL')
makedepends=('python2-distutils-extra')
optdepends=('empathy')
source=("https://launchpadlibrarian.net/167554016/${pkgname}_${pkgver}.orig.tar.gz")
md5sums=('cdb4b6e55d1e05050d1e9f19389dff53')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python2 ./setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python2 ./setup.py install --prefix=/usr --root=$pkgdir
}
