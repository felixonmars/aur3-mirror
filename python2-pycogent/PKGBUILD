# Maintainer: Adam Caldwell <adam.caldwell@gmail.com>
# Contributor: Yerko Escalona <yescalona@ug.uchile.cl>

pkgname=python2-pycogent
_pkgname=PyCogent
pkgver=1.5.3
pkgrel=1
pkgdesc="COmparative GENomic Toolkit"
arch=('any')
url="http://pycogent.org/"
license=('GPL')
depends=('python2' 'python2-numpy>=1.3.0')
source=(http://downloads.sourceforge.net/project/pycogent/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}.tgz)
sha256sums=('ad883cf4f8bbedd797b934a6ba75a20df2313736e84bff3d5a0e54ac41ea425c')

build() {
  cd $srcdir/${_pkgname}-${pkgver}
  python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 
}
