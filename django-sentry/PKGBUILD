# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=django-sentry
pkgver=1.13.5
pkgrel=1
pkgdesc="Sentry is a realtime event logging and aggregation platform. It specializes in monitoring errors."
arch=('any')
url="http://pypi.python.org/pypi/django-sentry"
license=('custom')
depends=('python2' 'django' 'django-paging' 'django-indexer')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/d/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('47d0103d9b657e442bad4599d4ca3387')

build() {
  cd "$srcdir/django-sentry-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/django-sentry-$pkgver"
  python2 setup.py install --root=$pkgdir/ --optimize=1
}

# vim:set ts=2 sw=2 et:
