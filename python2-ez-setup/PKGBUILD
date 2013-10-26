# Maintainer: Raymond Smith <raymondbarrettsmith at gmail dot com>
# Contributor: Gianni Vialetto <g dot vialetto at gmail dot com>
pkgname=python2-ez-setup
_realname=ez_setup
pkgver=0.9
pkgrel=1
pkgdesc="A replacement for python2 ez_setup module included blindly in various setup.py"
arch=(any)
url="https://github.com/ActiveState/ez_setup"
license=('PSF' 'ZPL')
depends=('python2' 'python2-distribute')
source=(http://pypi.python.org/packages/source/e/$_realname/$_realname-$pkgver.tar.gz)
#md5sums=('1ac53445a67bf68eb2676a72cc3f87f8')
#sha256sums=('303c5b17d552d1e3fb0505d80549f8579f557e13d8dc90e5ecef3c07d7f58642')
sha512sums=('4e66d17fd410217e964dcd177a208ea64ef79e3910fc524b6e6627e56e674e6d41761f2e33d8e0ae34096a7485804fa05157415b4d072eb61ff35d3996b563e9')

build() {
  cd "$srcdir/$_realname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_realname-$pkgver"
  python2 setup.py install --root=$pkgdir 
}
