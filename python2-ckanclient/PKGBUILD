# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=python2-ckanclient
pkgver=0.10
pkgrel=1
pkgdesc="Python module to read and write to a CKAN server."
arch=('any')
url="http://pypi.python.org/pypi/ckanclient"
license=('MIT')
source=(http://pypi.python.org/packages/source/c/ckanclient/ckanclient-$pkgver.tar.gz)
depends=('python2')
makedepends=('python2-distribute')
md5sums=('3056f44374d369887d87882c879a1a86')
 
package() {
   cd $srcdir/ckanclient-$pkgver
   python2 setup.py install --root $pkgdir
}