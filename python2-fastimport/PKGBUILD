# Maintainer: Nuno Araujo <nuno.araujo at russo79.com>
pkgbase=python-fastimport
pkgname=python2-fastimport
pkgver=0.9.2
pkgrel=1
pkgdesc="Fastimport parser in Python"
arch=(any)
url="https://launchpad.net/python-fastimport"
license=('GPL')
provides=("$pkgname-bzr")

_rls="$pkgbase-$pkgver"
source=(
  "$url/trunk/$pkgver/+download/$_rls.tar.gz"
  "$url/trunk/$pkgver/+download/$_rls.tar.gz.asc"
)
md5sums=(68972ad820785ec3247ec7bad0bfa6ea SKIP)

package() {
  cd "$srcdir/$_rls"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
