pkgname=python-xattr-git
pkgver=93.ab5d7cb
pkgrel=1
pkgdesc="Module for manipulating filesystem extended attributes"
arch=(i686 x86_64)
url="https://github.com/xattr/xattr"
license=('MIT' 'PSF')
depends=('python' 'python-cffi')
makedepends=('git' 'python-setuptools')
provides=('python-xattr=0.7.5')
conflicts=('python-xattr')
source=("$pkgname"::'git://github.com/xattr/xattr.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root=${pkgdir} --prefix=/usr
}
