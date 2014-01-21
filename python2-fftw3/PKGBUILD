#Maintainer: Paul Viren <paul dot viren at ircameras dot com>

pkgname=python2-fftw3
pkgver=0.2.2
pkgrel=2
pkgdesc="Python bindings to the FFTW3 C-library"
arch=(any)
url="http://launchpad.net/pyfftw"
license=('GPL3')
depends=('python2' 'python2-numpy' 'fftw')
options=(!emptydirs)
source=(http://launchpad.net/pyfftw/trunk/${pkgver}/+download/PyFFTW3-${pkgver}.tar.gz)

package() {
    cd ${srcdir}/PyFFTW3-${pkgver}
    python2 setup.py install --root=${pkgdir}/ --optimize=1 || return 1
}

md5sums=('0a98bbac3979abef4b87251530101331')
