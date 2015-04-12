# Maintainer: Eric Liu <eric@hnws.me>
pkgname=python2-python-magic
relname=python-magic
pkgver=0.4.3
pkgrel=1
pkgdesc="python-magic is a python interface to the libmagic file type identification library. libmagic identifies file types by checking their headers according to a predefined list of file types."
arch=('any')
url="https://github.com/ahupp/python-magic"
license=('MIT')
groups=()
depends=('python2')
makedepends=()
provides=('python2-python-magic')
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://github.com/ahupp/$relname/archive/$pkgver.tar.gz")
md5sums=('19ca6b9733cfcd5e9c99f764c1157cf9')

package() {
  tar xzf "$pkgver.tar.gz"
  cd "$srcdir/$relname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
