# Maintainer: crazyelf5

pkgname=cinnamon-extension-gpaste
pkgver=2.5.0
pkgrel=2
pkgdesc="A clipboard management extension written in Vala"
arch=('any')
url="https://launchpad.net/~merlwiz79/+archive/cinnamon-ppa"
license=('GPL3')
depends=('cinnamon' 'xcb-util-keysyms')
makedepends=('vala')
provides=('gpaste')
conflicts=('gpaste')
options=('!emptydirs')
install=$pkgname.install
source=(${url}/+files/gpaste_${pkgver}.orig.tar.gz
        02_add-cinnamon-extension.patch)
md5sums=('e7e0da1a00662fa27d37515abeebcf2d'
         'b7be00eca9ba4548f54dbf9923b01ecd')

build() {
  cd "$srcdir/gpaste-$pkgver/"

  patch -p1 -i ../02_add-cinnamon-extension.patch

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --libexecdir=/usr/lib \
              --enable-applet \
              --disable-gnome-shell-extension \
              --disable-schemas-compile
  make
}

package() {
  cd "$srcdir/gpaste-$pkgver/"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
