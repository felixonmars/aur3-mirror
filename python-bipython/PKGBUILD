# Contributor: vsilv <vsilverlord@googlemail.com>
# Maintainer : vsilv <vsilverlord@googlemail.com>
pkgname=python-bipython
pkgver=0.1.0
pkgrel=1
pkgdesc="bipython"
arch=('i686' 'x86_64')
url="https://github.com/ivanov/bipython"
license=('BSD')
depends=('python' 'ipython' 'python-pyzmq' 'bpython' 'python-urwid')
makedepends=('git')
provides=('python-bipython')
source=('bipython::git+https://github.com/ivanov/bipython.git')

md5sums=('SKIP')
_gitname='bipython'

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
