# Maintainer: Clément Mairet <clement.mairet@tigris.fr>
pkgname=spyrit
pkgver=0.4
pkgrel=1
pkgdesc="A modern client for MUSH, MUCK, MOO and MUD textual roleplaying games."
arch=("any")
url="http://spyrit.ierne.eu.org/"
license=("GPL")
depends=("python2-pyqt")
optdepends=("python-pygame: for sound notifications")
source=("${pkgname}-${pkgver}.py::http://sourceforge.net/projects/spyrit/files/Spyrit/v${pkgver}/Spyrit-${pkgver}.py/download")
md5sums=('851fc7511dc9aa5d5a722db87f441eba')

build() {
  # Change python to python2 to be compatible with Arch
  cd "$srcdir"
  sed -i "1s/python/python2/" ${pkgname}-${pkgver}.py
}

package() {
  install -D -m755 $srcdir/${pkgname}-${pkgver}.py $pkgdir/usr/bin/${pkgname}
}

# vim:set ts=2 sw=2 et:
