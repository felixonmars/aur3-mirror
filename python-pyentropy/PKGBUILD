# Maintainer: Yerko Escalona <yescalona@ug.uchile.cl>

pkgname=python-pyentropy
_pkgname=pyentropy
pkgver=0.4.0
pkgrel=2
pkgdesc="Entropy and Information Theory Toolbox for Python"
arch=('any')
url="http://code.google.com/p/pyentropy/"
license=('GPL2')
depends=('python2')
source=(http://pyentropy.googlecode.com/files/${_pkgname}-${pkgver}.tar.gz)
md5sums=('ca9fc52a6d789b3bd7f6cc35e7707576')

build() {
  cd $srcdir/${_pkgname}-${pkgver}
  python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 
}
