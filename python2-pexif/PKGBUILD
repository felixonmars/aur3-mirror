# Maintainer: Eric Liu <eric@hnws.me>
pkgname=python2-pexif
relname=pexif
pkgver=0.15
pkgrel=2
pkgdesc="A module for editing JPEG EXIF data"
arch=('any')
url="http://www.benno.id.au/code/pexif/"
license=('GPL')
groups=()
depends=('python2') 
makedepends=()
provides=('python2-pexif')
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://pypi.python.org/packages/source/p/$relname/$relname-$pkgver.tar.gz")
md5sums=('34f8ab22b15580a5965c22c455e00ee0')

package() {
  tar xzf "$relname-$pkgver.tar.gz"
  cd "$srcdir/$relname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
