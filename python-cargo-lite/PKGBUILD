# Maintainer: Peter Marheine <peter@taricorp.net>
_pkgname=cargo-lite
pkgname=python-${_pkgname}
pkgver=1.1.2
pkgrel=2
pkgdesc="An interim package manager for the Rust language"
arch=(any)
url="https://pypi.python.org/pypi/cargo-lite/"
license=('custom' 'APACHE')
groups=()
depends=('python' 'python-docopt' 'python-toml' 'python-sh' 'python-pyblake2' 'python-colorama')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://pypi.python.org/packages/source/c/cargo-lite/cargo-lite-${pkgver}.tar.gz")
md5sums=('944059a048251154bbaa0463ee9a470c')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
