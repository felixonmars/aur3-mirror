# Contributor: Luka Perkov <pybruteforce <at> lukaperkov <dOt> net>

pkgname=pybruteforce
pkgver=0.0.0
pkgrel=1
pkgdesc="pybruteforce calculates variations with repetition. Can be used to provide that functionality to cracking applications."
url="http://lukaperkov.net/"
license=('GPL')
arch=('i686' 'x86_64')
makedepends=('python')
source=(http://code.lukaperkov.net/${pkgname}-${pkgver}.tar.gz)

md5sums=('5bc8328a828c5fe1b697f4e69f909da2')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  python setup.py config || return 1
  python setup.py build || return 1
  python setup.py install --root=${startdir}/pkg --optimize=2 || return 1
}
