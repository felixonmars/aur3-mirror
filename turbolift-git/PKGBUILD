# Maintainer: Evan Callicoat <apsu@propter.net>
pkgname=turbolift-git
_gitname=turbolift
pkgver=v1.4.7.2.g85d8d16
pkgrel=1
pkgdesc="A very fast Rackspace Cloud-Files upload/download tool."
arch=('i686' 'x86_64')
url="http://github.com/cloudnull/turbolift"
license=('GPL')
depends=('python2')
makedepends=('git' 'python2' 'python2-setuptools')
provides=('turbolift')
conflicts=('turbolift')
source=('git://github.com/cloudnull/turbolift.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $_gitname

  python2 setup.py build
}

package() {
  cd $_gitname

  python2 setup.py install --root="${pkgdir}"
}
