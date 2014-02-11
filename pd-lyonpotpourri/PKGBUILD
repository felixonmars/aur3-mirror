# Maintainer: Em Ludek <ludek.me@gmail.com>
pkgname=pd-lyonpotpourri
_pkg=LyonPotpourri
pkgver=3.0
pkgrel=1
pkgdesc="A collection of Pure Data externals for creating and performing computer music"
arch=('any')
url="http://disis.music.vt.edu/eric/LyonSoftware/Pd/LyonPotpourri/"
license=('MIT')
depends=('pd')
source=("http://disis.music.vt.edu/eric/LyonSoftware/Pd/$_pkg/${_pkg}${pkgver}_Pd.zip")
md5sums=('5aff6f0e1c5193eb8a15e2768e88cb1e')

build() {
  cd "$srcdir/${_pkg}${pkgver}_Pd"

  sed -i 's|usr/local|usr|g' Makefile
  sed -i 's|pd-externals|pd/extra|g' Makefile

  sed -i 's|HELPPATCHES ?= $(SOURCES:.c=-help.pd) |HELPPATCHES ?= $($(foreach source,$(SOURCES),'"${_pkg,,}-helpfiles\/"'$(source)):.c=-help.pd) |g' Makefile
  sed -i 's|INSTALL_DATA) examples|INSTALL_DATA) '"${_pkg,,}-helpfiles/sound"'|g' Makefile

  make
}

package() {
  cd "$srcdir/${_pkg}${pkgver}_Pd"

  make DESTDIR="$pkgdir" install
}
