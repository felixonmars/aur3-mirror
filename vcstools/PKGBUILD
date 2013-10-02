# Contributor: Georg Bremer <pkgbuild@dschoordsch.de>

pkgname=('vcstools')
pkgver=0.1.31
pkgrel=2
pkgdesc=""
arch=('any')
url="http://ros.org/"
license=('BSD')
groups=()
depends=('python2' 'python2-yaml')
makedepends=('python2-setuptools')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("http://download.ros.org/downloads/vcstools/vcstools-$pkgver.tar.gz")
md5sums=('4c0b48e96b7a2ca5e8a956e65f479126')


noextract=()

build() {
  echo ""
}

package() {
    cd "$srcdir/vcstools-$pkgver"
    python2 setup.py install --root "$pkgdir"
}
# vim:set ts=2 sw=2 et:
