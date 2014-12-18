# Maintainer: tinxy <arch at tinx dot eu>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=gnoduino-git
pkgver=1087.3729f7f
pkgrel=2
pkgdesc="GNOME Implementation of Arduino IDE in python"
arch=(any)
url="http://gnome.eu.org/index.php/Gnoduino"
license=('GPL')
depends=('avr-libc' 'avrdude' 'avr-binutils' 'gcc-avr' 'pyxdg'
         'pygtksourceview2' 'python2-pyserial' 'python2-gconf'
         'desktop-file-utils')
makedepends=('git' 'python2-distribute' 'python2-distutils-extra')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
install="$pkgname.install"
source=("${pkgname%-*}::git+https://git.gnome.org/browse/gnoduino.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-*}"
  echo $(git rev-list HEAD --count).$(git rev-parse --short HEAD)
}

prepare() {
  cd "$srcdir/${pkgname%-*}"

  # do not install gconf schema
  sed -i "/installSchema.*)$/d" setup.py

  # python2 shebang
  sed -i "s|bin/python$|&2|" `find . -name "*.py"`
}

build() {
  cd "$srcdir/${pkgname%-*}"
  python2 setup.py pixmaps
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname%-*}"
  python2 setup.py install --root="$pkgdir/"

  # gconf schema
  install -Dm644 "data/${pkgname%-*}.schemas" "$pkgdir/usr/share/gconf/schemas/$pkgname.schemas"
}
