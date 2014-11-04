# Maintainer: Steeve Chailloux <steevechailloux at gmail.com>
_pkgbase=yasal
pkgname=python2-yasal
pkgver=1.0.5
pkgrel=6
pkgdesc="Yet another save as link"
arch=('any')
url="https://github.com/WnP/yasal"
license=('MIT')
depends=('python2' 'python2-beautifulsoup3' 'python2-setuptools')
makedepends=()
provides=('python2-yasal')
options=(!emptydirs)
source=(http://pypi.python.org/packages/source/y/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz)
md5sums=('87dda9e4b6d1d4143d2e879da41ab10a')

package() {
  cd "$srcdir/$_pkgbase-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
