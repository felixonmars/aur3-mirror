# Contributor: Roberto Gea (Alquimista) <alquimistaotaku@gmail.com>

pkgname=currency
pkgver=0.1.2
pkgrel=2
pkgdesc="Currency Converter"
arch=(any)
url="https://bitbucket.org/alquimista"
license=("MIT")
depends=("python2")
makedepends=("python2-distribute")
source=(http://pypi.python.org/packages/source/C/Currency/Currency-${pkgver}.tar.gz)
options=(!emptydirs)
md5sums=('7bdcdfdde21b43e2a3a7b2d531e3ed6d') #generate with 'makepkg -g'


build() {
  cd $srcdir/Currency-${pkgver}
  python2 setup.py build
}

package() {
  cd $srcdir/Currency-${pkgver}
  python2 setup.py install --root=$pkgdir --optimize=1
}
