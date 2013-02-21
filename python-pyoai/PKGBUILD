# Maintainer: Sarwo Hadi Setyana <sh.setyana@gmail.com>

pkgname=python-pyoai
pkgver=2.4.4
pkgrel=1
pkgdesc="The oaipmh module is a Python implementation of an Open Archives Initiative Protocol for Metadata Harvesting (version 2) client and server"
arch=(any)
url="https://pypi.python.org/pypi/pyoai"
license=('BSD')
depends=('python2' 'python2-distribute' 'python2-lxml')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://pypi.python.org/packages/source/p/pyoai/pyoai-${pkgver}.tar.gz")

md5sums=('d3639011cb4d08547ce96d58669f4448')
 
package() {
    cd "$srcdir/pyoai-$pkgver"
    python2 setup.py install --root="$pkgdir/"
 
    install -D -m644 README.rst ${pkgdir}/usr/share/doc/${pkgname}/README
    install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}