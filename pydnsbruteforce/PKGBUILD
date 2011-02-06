# Contributor: Luka Perkov <pydnsbruteforce <at> lukaperkov <dOt> net>

pkgname=pydnsbruteforce
pkgver=0.1.0
pkgrel=1
pkgdesc="pydnsbruteforce retrieves information from name servers."
url="http://lukaperkov.net/"
license=('GPL')
arch=('i686' 'x86_64')
makedepends=('python' 'python-dnspython' 'python-ipaddr' 'pybruteforce')
source=(http://code.lukaperkov.net/${pkgname}-${pkgver}.tar.gz)

md5sums=('3aa607d976f507aae3d5891ef63ddcab')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  python setup.py config || return 1
  python setup.py build || return 1
  python setup.py install --root=${startdir}/pkg --optimize=2 || return 1
}
