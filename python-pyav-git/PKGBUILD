pkgname=python-pyav-git
_pkgname=PyAV
pkgver=404
pkgrel=1
pkgdesc='Pythonic bindings for FFmpeg'
arch=('any')
url='https://github.com/mikeboers/PyAV'
license=('custom')
depends=(
  'python'
)
makedepends=('python-setuptools' 'cython')
source=("git+https://github.com/mikeboers/PyAV.git")
sha1sums=('SKIP')

package() {
  cd "$srcdir/$_pkgname"

  python setup.py install --root="$pkgdir"

  # do not include the tests/ generated from the install
  rm -Rfv "$pkgdir/usr/lib/python*/site-packages/tests"
}

# vim:set ts=2 sw=2 et:
