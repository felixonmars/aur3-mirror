# Maintainer: Sarkasper <echo a2FzcGVyLm1lbnRlbkBnbXguY29tCg== | base64 -d>
# Contributor: Jeremy Sands <cto@jeremysands.com>

pkgname=boodler
pkgver=2.0.4
pkgrel=5
pkgdesc="Dynamic soundscape creator, capable of producing things such as endless thunderstorm sounds."
arch=('any')
url="http://boodler.org"
license=('LGPL')
depends=('python2')
optdepends=('boodler-qt: GUI')
install=${pkgname}.install
source=("http://boodler.org/dl/Boodler-$pkgver.tar.gz")
md5sums=('79c2c20733416998659ab2e2d310d88a')

package() {
    cd "$srcdir/Boodler-$pkgver"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
