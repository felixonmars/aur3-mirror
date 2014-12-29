# Maintainer: Michael Bernhard Arp Sørensen <michael@arpsorensen.dk>

pkgname=python2-ropemode
_pkgname=ropemode
pkgver=0.2
pkgrel=2
pkgdesc="A helper for using rope refactoring library in IDEs"
url='http://bitbucket.org/agr/ropemode'
arch=('any')
license=('GPL')
depends=('python2-rope')
source=("https://github.com/python-rope/ropemode/archive/master.zip")
md5sums=('5e1e5c132a380906b00b12432dd6236b')

package() {
  cd "${srcdir}/ropemode-master"
  python2 ./setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1
}
