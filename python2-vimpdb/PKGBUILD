# Contributor: tocer <tocer.deng@gmail.com>

pkgname=python2-vimpdb
_pkgname=vimpdb
pkgver=0.4.5
pkgrel=1
pkgdesc="This package provides an integration of the Python debugger pdb into the VIM editor."
arch=(any)
url="http://github.com/gotcha/vimpdb"
license=(MIT)
depends=('python2')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://pypi.python.org/packages/source/v/vimpdb/$_pkgname-$pkgver.tar.gz")
md5sums=('14c35b21b3ca8e01b1f832513a134f6f')

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir/ --optimize=1 || return 1

  # Remember to install licenses if the license is not a common license!
  # install -D -m644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}


