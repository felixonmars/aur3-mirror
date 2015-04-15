# Maintainer: Peter Marheine <peter@taricorp.net>
_pkgname=toml
pkgname=python-${_pkgname}
pkgver=0.9.0
pkgrel=1
pkgdesc="Python library for Tom's Obvious, Minimal Language"
arch=(any)
url="https://pypi.python.org/pypi/toml/"
license=('custom')
groups=()
depends=('python')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://pypi.python.org/packages/source/t/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "LICENSE")
sha1sums=('bb6c53f872ff6172fc250bf303da391e63e16280'
          '1817d821f950e52c350570e604cf35c1fd22cd29')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
