# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Victor Noel

_hgrepo=python-keyring-lib
pkgname=python2-keyring-hg
pkgver=r750.8aadf61db38c
pkgrel=1
pkgdesc="Store and access your passwords safely."
arch=('any')
url="http://pypi.python.org/pypi/keyring"
license=('PSF')
depends=('python2')
makedepends=('mercurial')
provides=('python2-keyring')
conflicts=('python2-keyring')
source=(hg+https://bitbucket.org/kang/python-keyring-lib)
md5sums=('SKIP')


pkgver() {
  cd "$_hgrepo"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd "$srcdir/$_hgrepo"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_hgrepo"
  python2 setup.py install --root=$pkgdir --prefix=/usr
}
