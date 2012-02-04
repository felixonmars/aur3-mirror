# Maintainer: Pierre Bourdon <delroth@gmail.com>

pkgname=python-audiere
_dlpkgname=pyaudiere
pkgdesc="High level audio playback library for Python (also known as PyAudiere)"
pkgver=0.2
pkgrel=1
url="http://pyaudiere.org/"
license=('LGPL')

arch=(i686 x86_64)
depends=('python2' 'python2-numpy' 'audiere')
makedepends=('setuptools')

source=("http://pyaudiere.org/download.php?get=pyaudiere-0.2.tar.gz")
sha256sums=('6c0a1031915ffb875c3131970e4e7f36911a24520b253eb90ae9960bdf0e9c6c')

build() {
  cd ${srcdir}/${_dlpkgname}-${pkgver}
  python2 setup.py install --root=${pkgdir} --optimize=1 || return 1
}
