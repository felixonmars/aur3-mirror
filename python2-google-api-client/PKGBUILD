# Maintainer: Marcel Brueggebors <marcel Aet nightsoul D0t org>

pkgname=python2-google-api-client
pkgver=1.0beta7
pkgrel=1
pkgdesc="Client library for Google's discovery based APIs."
arch=(any)
url="http://code.google.com/p/google-api-python-client/"
license=('Apache')
makedepends=(python2-distribute)
depends=(python2 python2-httplib2 python2-gflags python2-oauth2)
options=(!emptydirs)
source=(http://google-api-python-client.googlecode.com/files/google-api-python-client-$pkgver.tar.gz)
md5sums=('7076824f786fb49ac34b7b3c78e44771')
install=

package() {
  cd "$srcdir/google-api-python-client-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
