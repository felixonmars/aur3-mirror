# Maintainer: Eric Liu <eric@hnws.me>
pkgname=python2-statsd
relname=pystatsd
pkgver=3.1
pkgrel=1
pkgdesc="A Python client for statsd http://statsd.readthedocs.org/"
arch=('any')
url="https://github.com/jsocol/pystatsd"
license=('MIT')
groups=()
depends=('python2')
makedepends=()
provides=('python2-statsd')
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://github.com/jsocol/$relname/archive/v$pkgver.tar.gz")
md5sums=('2fe1bf0950b0c6e97e1ef8dc5c9af9d2')


package() {
  tar xzf "v$pkgver.tar.gz"
  cd "$srcdir/$relname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
