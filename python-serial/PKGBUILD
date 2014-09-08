# Maintainer: kpj <kpjkpjkpjkpjkpjkpj@gmail.com>
PACKAGER="kpj <kpjkpjkpjkpjkpjkpj@gmail.com>"

pkgname="python-serial"
pkgver=2.7
pkgrel=1
pkgdesc="Python module which encapsulates the access for the serial port"
arch=('any')
url="http://pyserial.sourceforge.net/"
license=('MIT')
depends=('python')
conflicts=('python-serial')
provides=('python-serial')
source=("https://pypi.python.org/packages/source/p/pyserial/pyserial-$pkgver.tar.gz")
md5sums=('794506184df83ef2290de0d18803dd11')


package() {
    cd "pyserial-$pkgver"
    python setup.py install --root="${pkgdir}"
}
