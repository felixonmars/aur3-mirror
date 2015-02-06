# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/Python_Package_Guidelines for more
# information on Python packaging.

# Maintainer: Timothy Rice <t.rice@ms.unimelb.edu.au>
_modulename=pandocfilters
pkgname=python2-$_modulename
pkgver=1.2.3
pkgrel=1
pkgdesc="A python module for writing pandoc filters."
arch=(any)
url="https://pypi.python.org/pypi/pandocfilters"
license=('BSD')
groups=()
depends=('python2')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(https://pypi.python.org/packages/source/p/${_modulename}/${_modulename}-${pkgver}.tar.gz)
md5sums=('85ad8f9432071312b214d8a75f20c450')

package() {
  cd "$srcdir/${_modulename}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
