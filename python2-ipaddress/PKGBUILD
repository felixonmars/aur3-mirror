# Contributor: Nikolaus Brandt <sua-aur-661bbb3b@brandt-n.eu>
pkgname=python2-ipaddress
pkgver=1.0.7
pkgrel=1
pkgdesc="IPv4/IPv6 manipulation library"
arch=(any)
url="https://github.com/phihag/ipaddress"
license=('custom:PSF')
depends=('python2')
source=("https://pypi.python.org/packages/source/i/ipaddress/ipaddress-1.0.7.tar.gz")
sha512sums=('bfbb7ab47c50b1a370dab6905e3212fcd960ecdfa2180605d0775f90f80485040a3760d7042ae503a52d1931e44a0b2dc102de22a107cf2dc4b1e7a441841e8b')

package() {
    cd $srcdir/${pkgname/python2-/}-$pkgver
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
