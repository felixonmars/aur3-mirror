# Contributor: Vojtěch Aschenbrenner <v@asch.cz>
# Maintainer: Vojtěch Aschenbrenner <v@asch.cz>

pkgname=python2-invoicegenerator
pkgver=0.4.5
pkgrel=1
pkgdesc="Python2 library to generate PDF invoice"
arch=('any')
url="https://github.com/creckx/InvoiceGenerator"
license=('BSD')
depends=('python2' 'python2-reportlab' 'python2-pillow' 'python2-qrplatba>=0.3.3')
makedepends=('python2-setuptools')
conflicts=(python2-invoicegenerator-git)
source=("https://pypi.python.org/packages/source/I/InvoiceGenerator/InvoiceGenerator-${pkgver}.tar.gz"
        'fonts.patch')
sha512sums=('583fcfea934fc491c407633a19633c3ee73a366815eb9125e47ead12d56a047d324f46e508b57e961873f9e997d94c389c15b8f30e7bf722b3f6603d5c785e82'
            '1ebc74c31c555930e2f7cad677acefeed98e7671ec009e06fcaf7547c9950253617edc8f8415b617fa7cd48523ac7016e019eaafa7447c84811c46b8069999cb')

package() {
  cd "$srcdir/InvoiceGenerator-$pkgver"
  patch InvoiceGenerator/conf.py < ../../fonts.patch

  python2 setup.py install --root="${pkgdir}" --optimize=1
}
