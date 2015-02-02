# Maintainer : Gergely Imreh <imrehgATgmailDOTcom>
pkgname=cfclient
pkgver=2014.12.3
pkgrel=1
pkgdesc="Crazyflie quadcopter Python client and libraries"
arch=('any')
url="http://www.bitcraze.se/"
license=('GPL')
makedepends=('python2-distribute')
depends=('python2' 'python2-pysdl2' 'python2-pyusb' 'libusb' 'python2-scipy' 'python2-pyqt4' 'python2-pyqtgraph')
source=(https://github.com/bitcraze/crazyflie-clients-python/archive/${pkgver}.tar.gz)
package() {
  PYTHON=python2
  cd "${srcdir}/crazyflie-clients-python-${pkgver}"
  ${PYTHON} setup.py install --root "${pkgdir}" --prefix=/usr/ --install-data=/usr/share/ --optimize=1 || return 1

  install -Dm755 "${pkgdir}/usr/share/LICENSE.txt" "${pkgdir}/usr/share/licenses/cfclient/LICENSE.txt"
  rm "${pkgdir}/usr/share/LICENSE.txt"

  install -Dm755 "${pkgdir}/usr/share/README.md" "${pkgdir}/usr/share/cfclient/README.md"
  rm "${pkgdir}/usr/share/README.md"
}
sha256sums=('2f4cb0233fd44ef6a0b5c61261dac6a76dccb4a66e95629e5f3c8ba934378582')
