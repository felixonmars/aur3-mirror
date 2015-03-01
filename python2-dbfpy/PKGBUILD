# Maintainer: Ričardas V. <ricardas.v@inbox.lt>
# Contributor: Fazlul Shahriar <fshahriar@gmail.com>

pkgname=python2-dbfpy
pkgver=2.3.0
pkgrel=1
pkgdesc="Python module for reading and writing DBF-files."
url="http://dbfpy.sourceforge.net/"
arch=(any)
license=('custom:PD')
depends=('python2')
conflicts=("python-dbfpy")
replaces=("python-dbfpyc")

source=("http://downloads.sourceforge.net/project/dbfpy/dbfpy/$pkgver/dbfpy-$pkgver.tar.gz")
md5sums=('c7e1a2cfbfeca4904f33e272de309c45')

package() {
  cd "$srcdir/dbfpy-$pkgver"
  python2 setup.py install --root=$pkgdir
}
