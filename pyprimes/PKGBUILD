# $Id$
# Maintainer: Massimo Bolognese <massimobolognese6@gmail.com>


pkgname=pyprimes
pkgver=0.1.1a
pkgrel=1
pkgdesc="Compare a variety of algorithms for generating and testing prime numbers"
arch=('i686' 'x86_64')
url="https://pypi.python.org/pypi/pyprimes/0.1.1a#downloads"
license=('MIT')
depends=('python') 
makedepends=()
provides=("$pkgname-$pkgver")
conflicts=()
replaces=()
source=(https://pypi.python.org/packages/source/p/pyprimes/pyprimes-0.1.1a.tar.gz#md5=212824cab8d011d02ca72a66d468fa23)
md5sums=('212824cab8d011d02ca72a66d468fa23')



package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/"
    

  # Install license
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENCE.txt" \
                 "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE.txt"
}
