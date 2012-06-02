# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=gradiator
pkgver=12.04.3
pkgrel=1
pkgdesc="CSS3 gradient generator"
arch=(any)
url="http://caffeinatedco.de/gradiator.php"
license=('GPL')
depends=("pywebkitgtk")
makedepends=("python2-distutils-extra")
source=(http://ppa.launchpad.net/cooperjona/gradiator/ubuntu/pool/main/g/gradiator/gradiator_$pkgver.tar.gz)

build() {
	cd "$srcdir/quickly_trunk"
	python2 setup.py install --root="$pkgdir" --prefix=/usr
}

md5sums=('050b2041e0c9ee01dac86dd55058ceaa')
