# Maintainer: David Verelst <david dot verelst at gmail com>
pkgname=python2-pydy-git
_gitname=pydy
pkgver=648.04e9db0
pkgrel=1
pkgdesc="PyDy, short for Python Dynamics, is a tool kit to study multibody dynamics with Python. "
arch=('i686' 'x86_64')
url="http://pydy.org/"
license=('BSD')
depends=('python2-numpy>=1.6.1' 'python2-sympy>=0.7.4.1' 'python2-scipy>=0.9.0'
         'python2-matplotlib>=0.99.0' 'ipython2>=0.13.0')
provides=('python2-pydy')
conflicts=('python2-pydy')
makedepends=('python2-nose')
optdepends=('cython2: code generation backend' 'python2-theano: code generation backend')
options=(!emptydirs)
source=('git://github.com/pydy/pydy.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  #git describe --always | sed 's|-|.|g'
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
   cd $_gitname
   python2 setup.py install --root="${pkgdir}" --optimize=1 || exit 1
   install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}


