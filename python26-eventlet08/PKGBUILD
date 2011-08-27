# Contributor: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=python26-eventlet08
_pkgname=python-eventlet-0.8
pkgver=0.8.11
pkgrel=2
pkgdesc="A networking library written in Python"
arch=('any')
url="http://www.sipsimpleclient.com/"
license=('MIT')
depends=('python2')
conflicts=('python26-eventlet')
provides=('python26-eventlet')
source=("http://download.ag-projects.com/SipClient/$_pkgname-$pkgver.tar.gz")
md5sums=('bb0076a4792e697bf1096fc8312dab44')

package() {
 cd "$srcdir/$_pkgname-$pkgver"
 python26 setup.py install --root="$pkgdir" --optimize=1
}
