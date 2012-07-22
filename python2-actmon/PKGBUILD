# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=python2-actmon
pkgver=0.1
pkgrel=1
pkgdesc="Provides a user idle timer for X11."
arch=(i686 x86_64)
url="http://github.com/agravier/actmon"
license=(GPL)
depends=(python2 libxss)
makedepends=(python2-distribute)
changelog=Changelog
conflicts=(${pkgname}-git)
source=("http://pypi.python.org/packages/source/a/actmon/actmon-${pkgver}.tar.gz")
md5sums=('92ec40e994442b4f227979bb11627c06')

package() {
  cd "${srcdir}/actmon-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
