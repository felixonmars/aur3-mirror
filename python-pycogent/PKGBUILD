# Maintainer: Yerko Escalona <yescalona@ug.uchile.cl>

pkgname=python-pycogent
_pkgname=PyCogent
pkgver=1.5.1
pkgrel=1
pkgdesc="COmparative GENomic Toolkit"
arch=('any')
url="http://pycogent.sourceforge.net/"
license=('GPL')
depends=('python2' 'python2-numpy')
source=(http://downloads.sourceforge.net/project/pycogent/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}.tgz)
md5sums=('c21015f55597b1c863fb1c9cc931eb23')

build() {
  cd $srcdir/${_pkgname}-${pkgver}
  python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 
}
