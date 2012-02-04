# Contributor: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=python26-xcaplib
_pkgname=python-xcaplib
pkgver=1.0.15
pkgrel=1
pkgdesc="A python library for managing XML documents on XCAP server"
license=('MIT')
arch=('any')
url="http://download.ag-projects.com/SipClient"
depends=('python26')
source=("http://download.ag-projects.com/SipClient/$_pkgname-$pkgver.tar.gz")
md5sums=('0328c9ee251c7fdfd73b0bf7b634f232')

package() {
 cd "$srcdir/$_pkgname-$pkgver"
 python26 setup.py install --root="$pkgdir" --optimize=1
}
