# Maintainer: Marek Petrik <marekpetrik at gmail dot com>

_gitname=numpydoc
pkgname=python-numpydoc-git
pkgver=0.5
pkgrel=2
pkgdesc="Sphinx extension for Numpy"
arch=('any')
url="https://github.com/numpy/numpydoc"
license=('BSD')
depends=('python')
makedepends=('git')
conflicts=(python-numpydoc)
replaces=()
provides=(python-numpydoc)
source=(git+http://github.com/numpy/numpydoc.git#tag=v$pkgver)
md5sums=('SKIP')

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --root="$pkgdir/" --optimize=1
}

