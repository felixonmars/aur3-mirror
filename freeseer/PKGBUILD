# Maintainer: speps <speps at aur dot archlinux dot org>

_commit=e20ebdd
pkgname=freeseer
pkgver=3.0.0
pkgrel=1
pkgdesc="A video capture utility capable of capturing presentations"
arch=('any')
url="https://github.com/Freeseer/freeseer"
license=('GPL3')
depends=('python2-pyqt4' 'python2-feedparser' 'python2-yapsy' 'gstreamer0.10-python')
makedepends=('python2-distribute')
install=$pkgname.install
source=("$url/tarball/v$pkgver")
md5sums=('07090fcfad6b128dd2dd057bcc34b34b')

prepare() {
  cd "$srcdir/${pkgname^}-$pkgname-$_commit/src"

  # DOS to Unix
  find . -name "*.py" -exec sed -i 's/\r//' {} \;

  # python2 shebang
  sed -i 's|bin/python$|&2|' `grep -rl bin/python .`

  # put icon in right path
  sed -i '/png/s/applications/pixmaps/' setup.py

  # install freeser plugins specs
  sed -i "/plugins/s/]/, 'plugins\/*\/*.freeseer-plugin']/" setup.py
}

build() {
  cd "$srcdir/${pkgname^}-$pkgname-$_commit/src"
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname^}-$pkgname-$_commit/src"
  python2 setup.py install --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
