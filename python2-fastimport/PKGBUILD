# Maintainer: Nuno Araujo <nuno.araujo at russo79.com>
pkgname=python2-fastimport
_realname=python-fastimport
pkgver=0.9.2
pkgrel=1
pkgdesc="Fastimport parser in Python"
arch=(any)
url="https://launchpad.net/python-fastimport"
license=('GPL')
provides=("$pkgname-bzr")

_rls="$_realname-$pkgver"
source=(
  "$url/trunk/$pkgver/+download/$_rls.tar.gz"
  "$url/trunk/$pkgver/+download/$_rls.tar.gz.asc"
)
md5sums=(68972ad820785ec3247ec7bad0bfa6ea d7a1a696b6cd6e7a7a490dcc882a132f)

build() {
  cd "$srcdir/$_rls"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
