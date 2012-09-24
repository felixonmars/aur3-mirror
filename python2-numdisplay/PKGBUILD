# Maintainer: Christian Dersch <chrisdersch@gmail.com>
pkgname=python2-numdisplay
pkgver=1.5.6
pkgrel=2
pkgdesc="Numdisplay provides the capability to visualize numpy array objects"
arch=('i686' 'x86_64')
url="http://stsdas.stsci.edu/numdisplay/"
license=('BSD')
groups=()
depends=('python2-numpy' 'ds9-bin')
source=(http://stsdas.stsci.edu/numdisplay/download/numdisplay-$pkgver.tar.gz
	numdisplay-numpy-fix.patch)
md5sums=('fef65232e2df100e2270f5c65f9f41bc'
         '2805755a34cb8ec0bd7484b85e41e4ef')

package() {
  cd $srcdir/numdisplay
  patch -p1 < $srcdir/numdisplay-numpy-fix.patch
  python2 setup.py install --root ${pkgdir}
} 
