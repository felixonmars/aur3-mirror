# Maintainer: Hakan Erduman <hakan at erduman dot de>
pkgname=xfce4-hamster-plugin
pkgver=1.6
pkgrel=2
pkgdesc="A recreation of the gnome-shell hamster extension as a xfce4 panel plugin."
url="https://github.com/projecthamster/${pkgname}"
arch=('x86_64' 'i686')
license=('GPL')
depends=('xfce4-panel' 'hamster-time-tracker')
makedepends=('pkgconfig' 'intltool' )
source=("https://github.com/projecthamster/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('9a2dc2610e7aaa28ec7d8f79c784749358ec84d6e07ce80228e75ff46b7ef1c1')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr --enable-silent-rules -silent --with-icon_name=hamster-time-tracker
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make || return 1
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
