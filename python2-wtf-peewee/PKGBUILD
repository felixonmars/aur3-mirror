# Maintainer: Dennis Fink <the_metalgamer@hackerspace.lu>
# Submitter: mitsuse <mitsuset at gmail>

pkgname=python2-wtf-peewee
pkgver=0.2.2
pkgrel=1
pkgdesc="WTForms integration for peewee models"
arch=(any)
url="http://pypi.python.org/pypi/wtf-peewee"
license=("MIT")
depends=("python2" "python2-peewee" "python2-wtforms")
makedepends=("python2-distribute")
source=("http://pypi.python.org/packages/source/w/wtf-peewee/wtf-peewee-$pkgver.tar.gz")
md5sums=('eb6b7cf5715b751e839d0f1d1c236753')

build() {
  cd "$srcdir/wtf-peewee-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/wtf-peewee-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}
