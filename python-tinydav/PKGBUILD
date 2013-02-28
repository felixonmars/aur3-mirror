# Maintainer: Felix Van der Jeugt <felix dot vanderjeugt at gmail dot com>
pkgname=python-tinydav
pkgver=0.7.3
pkgrel=1
epoch=
pkgdesc="Simple python webdav client."
arch=('any')
url="http://tinydav.googlecode.com"
license=('LGPL')
groups=()
depends=('python')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$url/files/tinydav-$pkgver.tar.gz")
noextract=()
md5sums=('051bc7892b15fb069927f34b9c416721')

build() {
  cd "$srcdir/tinydav-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/tinydav-$pkgver"
  python setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
