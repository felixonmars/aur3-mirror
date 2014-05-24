# Maintainer: milki <milki at rescomp dot berkeley dot edu>

pkgname=xml2rfc-python2
pkgver=2.4.7
pkgrel=1
pkgdesc="A tool to convert an RFC from XML to text, HTML and other formats."
arch=('any')
url="http://xml2rfc.tools.ietf.org/"
license=('custom')
depends=('python2>=2.7' 'python2-lxml>2.2.7')
conflicts=('xml2rfc-python')
source=("http://tools.ietf.org/tools/xml2rfc2/cli/xml2rfc-$pkgver.tar.gz")
sha256sums=('f75ec480b1b11ac55e5d6e3d35df5f8fe2e66c7a447f229eee9f1e9a63b2bfd2')

package() {
	cd $srcdir/xml2rfc-$pkgver
    python2 setup.py install --root="$pkgdir"
}
