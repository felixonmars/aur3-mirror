# Maintainer: Evan Callicoat <apsu@propter.net>
pkgname=python-docopt-git
_gitname=docopt
pkgver=0.6.1.46.g2dd6fe5
pkgrel=1
pkgdesc="A python library for parsing command-line arguments."
arch=('i686' 'x86_64')
url="http://github.com/docopt/docopt"
license=('GPL')
depends=('python')
makedepends=('git' 'python' 'python-setuptools')
provides=('python-docopt')
conflicts=('python-docopt')
source=('git://github.com/docopt/docopt')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $_gitname

  python setup.py build
}

package() {
  cd $_gitname

  python setup.py install --root="${pkgdir}"
}
