# Maintainer: Evan Callicoat <apsu@propter.net>
pkgname=python-requests-git
_gitname=requests
pkgver=v0.6.4.2331.gefbae18
pkgrel=1
pkgdesc="Python Requests library (2.0 branch)"
arch=('i686' 'x86_64')
url="http://github.com/kennethreitz/requests"
license=('GPL')
depends=('python')
makedepends=('git' 'python' 'python-setuptools')
provides=('python-requests')
conflicts=('python-requests')
source=('git://github.com/kennethreitz/requests.git#branch=2.0')
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
