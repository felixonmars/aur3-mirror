# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=datadeck
pkgver=0.4.0
pkgrel=2
pkgdesc="GUI for the dpm tool (once known as Datapkg), for working with data and interacting with CKAN."
arch=('any')
url="http://task3.cc/projects/datadeck/"
license=('BSD')
source=(http://pypi.python.org/packages/source/d/$pkgname/$pkgname-$pkgver.tar.gz)
depends=('python2-dpm-git' 'wxpython')
makedepends=('python2-distribute')
md5sums=('364a125f7889e14ba0b03678bdada83b')
 
package() {
   cd $srcdir/$pkgname-$pkgver 
   python2 setup.py install --root $pkgdir
}