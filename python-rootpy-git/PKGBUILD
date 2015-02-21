# Contributor: vsilv <vsilverlord@googlemail.com>
# Maintainer : vsilv <vsilverlord@googlemail.com>
pkgname=python-rootpy-git
pkgver=v0.1
pkgrel=1
pkgdesc="Rootpy"
arch=('i686' 'x86_64')
url="https://github.com/rootpy/"
license=('BSD')
depends=('python>=3.1' 'python-numpy>=1.5' 'python-scipy' 'python-requests' 'python-keyring')
makedepends=('git')
provides=('python-rootpy')
source=('rootpy::git+https://github.com/rootpy/rootpy.git')

md5sums=('SKIP')
_gitname='rootpy'

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}
build() {
  cd "${srcdir}/${_gitname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_gitname}"
  python setup.py install --prefix=/usr --root=${pkgdir} -O1 --skip-build
}
