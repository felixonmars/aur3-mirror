# Maintainer: Stefan Tatschner <stefan@sevenbyte.org>

pkgname=python-gitwrapper-git
pkgver=r23.af148d6
pkgrel=1
pkgdesc="A library to access Git repositories by wrapping system calls to the git binary"
arch=('any')
url="https://github.com/rumpelsepp/gitwrapper"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
conflicts=('python-gitwrapper')
provides=('python-gitwrapper')
source=("${pkgname}::git+https://github.com/rumpelsepp/gitwrapper.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  #git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
