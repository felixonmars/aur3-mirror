# Maintainer: Peter Marheine <peter@taricorp.net>
_pkgname=pyblake2
pkgname=python-${_pkgname}
pkgver=0.9.2
pkgrel=1
pkgdesc="Python module implementing the BLAKE2 hash function"
arch=(any)
url="https://pypi.python.org/pypi/pyblake2/"
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
source=("https://pypi.python.org/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "LICENSE")
sha1sums=('be28f6707e9ea4b4e94d5fe9b231e41cc422ec27'
          '82da472f6d00dc5f0a651f33ebb320aa9c7b08d0')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
