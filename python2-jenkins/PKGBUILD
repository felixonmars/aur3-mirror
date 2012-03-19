#Maintainer: "Dimitri Merejkowsky dmerejkowsky@aldebaran-robotics.com"

pkgname=python2-jenkins
pkgver="0.2"
pkgrel=1
pkgdesc="Python API for managing jobs and nodes in a Jenkins CI instance"
url="https://launchpad.net/python-jenkins"
arch=('any')
license=('BSD')
depends=('python2')
makedepends=('python2')
source=("https://launchpad.net/python-jenkins/${pkgver}/${pkgver}/+download/python-jenkins-${pkgver}.tar.gz")
md5sums=('5ede4af1845449491c0b5698335a86cb')

build() {
  cd ${srcdir}/python-jenkins-${pkgver}
  python2 setup.py build
}

package() {
  cd ${srcdir}/python-jenkins-${pkgver}
  python2 setup.py install --root=$pkgdir/ --optimize=1
  mkdir -p $pkgdir/usr/share/licenses/${pkgname}
  install COPYING $pkgdir/usr/share/licenses/${pkgname}/COPYING
}

# vim:set ts=2 sw=2 et:
