# Maintainer: Rob Lass <firstname dot lastname at gmail dot com>
pkgname=qstk-python2
pkgver=0.2.5
pkgrel=1
pkgdesc="QuantSoftware ToolKit"
arch=('i686' 'x86_64')
url="http://wiki.quantsoftware.org/index.php?title=QuantSoftware_ToolKit"
license=('New BSD')
conflicts=()
provides=()
#dependencies:
        #"numpy >= 1.6.1",
        #"scipy >= 0.9.0",
        #"matplotlib >= 1.1.0",
        #"pandas==0.7.3",
        #"python-dateutil >= 1.5",
        #"cvxopt >= 1.1.3",
        #"scikit-learn >= 0.11",
depends=('python>2.7'
  'python2-numpy>=1.6.1'
  'python2-scipy>=0.9.0'
  'python2-matplotlib>=1.1.0'
  'python2-pandas>=0.7.3'
  'python2-dateutil>=1.5'
  'python2-cvxopt>=1.1.3'
  'python2-scikit-learn>=0.11')
source=(http://pypi.python.org/packages/source/Q/QSTK/QSTK-0.2.5.tar.gz)
md5sums=('290e12cf789d2f56fbb1c8b7f8e78fbd')

build() {
  cd "$srcdir/QSTK-$pkgver"
  python2 setup.py build

}

package() {
  cd "$srcdir/QSTK-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
