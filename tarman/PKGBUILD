# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=tarman
pkgver=0.1.3
pkgrel=1
pkgdesc="Simple archive manager with curses interface."
arch=(any)
url="https://pypi.python.org/pypi/tarman"
license=(BSD)
depends=('python2' 'python2-libarchive')
makedepends=(python2-distribute)
changelog=Changelog
conflicts=('tarman-git')
source=("http://pypi.python.org/packages/source/t/${pkgname}/${pkgname}-${pkgver}.zip")
md5sums=('e58e2d0060e80d2b850ccbde6ff4b6b3')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
