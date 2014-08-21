# Maintainer: Charles Briere <charlesbriere dot flatzo at gmail dot com>

pkgname=pybugz
pkgver=0.10.1
pkgrel=2
pkgdesc="Python interface to Bugzilla"
arch=('i686' 'x86_64')
url="http://code.google.com/p/pybugz/"
license=('GNU GPL v2')
depends=("python2>=2.4" "python-elementtree")
source=("https://github.com/williamh/$pkgname/archive/$pkgver.zip")
sha1sums=('e9cf2dac7d19847620147a7910b09a40b1290239')

build() {
cd $srcdir/*$pkgname*
python2 setup.py install --root=$pkgdir
}
