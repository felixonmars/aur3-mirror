# based on python2-speaklater
# Contributor: warddr <aur@warddr.eu>
# Contributor: Frank Smit <frank/61924/nl>

pkgname=python-speaklater
pkgver=1.3
pkgrel=1
pkgdesc='Implements a lazy string for python useful for use with gettext.'
arch=('any')
url='http://pypi.python.org/pypi/speaklater/'
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("http://pypi.python.org/packages/source/s/speaklater/speaklater-$pkgver.tar.gz")
sha256sums=('59fea336d0eed38c1f0bf3181ee1222d0ef45f3a9dd34ebe65e6bfffdd6a65a9')

package() {
  cd "$srcdir/speaklater-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
