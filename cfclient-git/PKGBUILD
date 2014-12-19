# Maintainer: Danilo Bargen gezuru döt gmail ât com
pkgname=cfclient-git
_reponame=crazyflie-clients-python
pkgver=2014.12.1.r3.g2d2ce86
pkgrel=1
pkgdesc="Host applications and library for Crazyflie written in Python."
arch=('i686' 'x86_64')
url="https://github.com/bitcraze/$_reponame"
license=('GPL')
makedepends=('git' 'python2' 'python2-distribute')
depends=('python2'
         'python2-pysdl2'
         'python2-pyusb' 'libusb'
         'python2-scipy'
         'python2-pyqt4' 'python2-pyqtgraph')
provides=('cfclient')
conflicts=('cfclient')
changelog=
source=("${_reponame}::git+https://github.com/bitcraze/${_reponame}.git#branch=master")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_reponame"
  python2 setup.py install --root "${pkgdir}" --optimize=1
}
