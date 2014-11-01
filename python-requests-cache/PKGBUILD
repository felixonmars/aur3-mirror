# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=python-requests-cache
pkgver=0.4.6
pkgrel=1
pkgdesc="Persistent cache for requests library."
arch=(any)
url="https://pypi.python.org/pypi/requests-cache"
license=(BSD)
depends=(python)
makedepends=(python-distribute)
conflicts=(python-requests-cache-git)
changelog=Changelog
source=("http://pypi.python.org/packages/source/r/requests-cache/requests-cache-${pkgver}.zip")
md5sums=('47c6673bfd7aa32d60e6fcc5356124f9')

package() {
  cd "${srcdir}/requests-cache-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
