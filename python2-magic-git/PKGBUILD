# Maintainer: Martin Ortbauer <mortbauer@gmail.com>
pkgname=python2-magic-git
_gitname=python-magic
pkgver=a051eae
pkgrel=1
pkgdesc="This is the Python interface to the magic library providing file identificaiton services.."
arch=('any')
url="https://github.com/ahupp/python-magic"
license=('PSF')
depends=('python2')
makedepends=('git' 'python2-setuptools')
provides=('python2-magic')
conflicts=('python2-magic', 'python-magic')
replaces=('python2-magic')
source=("git+https://github.com/ahupp/${_gitname}")
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}

package() {
  cd "$srcdir/$_gitname"
  python2 setup.py install --root=$pkgdir/ --optimize=1
}

