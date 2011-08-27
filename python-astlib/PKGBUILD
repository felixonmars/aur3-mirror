# Contributor: clu

pkgname=python-astlib
pkgver=0.4.0
pkgrel=3
pkgdesc="Python astronomy modules"
arch=('i686' 'x86_64')
url="http://astlib.sourceforge.net"
license=("LGPL2.1")
depends=('python2' 'python-pyfits>=1.3' 'python-numpy>=1.3.0' 'python-scipy>=0.7.1' 'python-matplotlib>=0.98.3') 
makedepends=('python2' 'python2-distribute')
source=("http://downloads.sourceforge.net/project/astlib/astlib/$pkgver/astLib-$pkgver.tar.gz")
md5sums=('2f0f71f914cc434314b193797ee212b3')

package() {
  cd $srcdir/astLib-$pkgver
  python2 setup.py install --root=$pkgdir --prefix=/usr --optimize=1
}
