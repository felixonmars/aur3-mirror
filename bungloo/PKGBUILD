# Maintainer: Jacob Cook <jacob at jcook dot cc>
pkgname=bungloo
pkgver=1.4.3
pkgrel=1
pkgdesc="Tent protocol client"
arch=('any')
url="http://jabs.nu/bungloo"
license=('BSD')
groups=()
depends=('python2' 'python2-pyqt')
provides=('bungloo')
conflicts=()
backup=()
options=()
noextract=()
source=("$pkgname-$pkgver.tar.gz"::"http://jabs.nu/bungloo/download/$pkgname-$pkgver.tar.gz")
md5sums=('813896ebdd65285ce473806cfdc1fb75')

build() {
  cd "$srcdir"
  tar xvzf "$pkgname-$pkgver.tar.gz"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
