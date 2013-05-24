# Maintainer: Juri Vitali <juma993@gmail.com>
pkgname=plasduino
pkgver=0.11.1
pkgrel=1
pkgdesc="Open source data acquisition framework"
arch=('any')
url="http://pythonhosted.org/plasduino/"
license=('GPL')

depends=('python2' 'python2-pyqt' 'python2-pyserial' 'python2-pyaudio' 'pyqwt' 'avrdude' 'ffmpeg')
optdepends=('arduino: for building own sketches and for debugging purposes'
	    'scons: to compile sketches against the arduino libraries')

options=(!emptydirs)
source=("$pkgname.install"
	"https://bitbucket.org/lbaldini/plasduino/get/$pkgver.tar.gz")
md5sums=('0410ea4164630838d8f9e834ebefb899'
	 '98e20dd71d3caa8c73eca0a32deefd3a')

install=$pkgname.install

package() {
  cd "$srcdir/lbaldini-plasduino-80580aa90fbb"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
