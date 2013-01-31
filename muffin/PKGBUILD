# Maintainer: Christopher Reimer <c[dot]reimer[at]googlemail[dot]com>
# Contributor: Adam Hani Schakaki <adam@schakaki.net>
# Contributor: Ner0

pkgname=muffin
pkgver=1.1.2
pkgrel=1
pkgdesc="Clutter-based evolution of Metacity"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/muffin"
license=('GPL2')
depends=('clutter' 'dconf' 'gobject-introspection' 'gsettings-desktop-schemas' 'libcanberra' 'libsm' 'startup-notification' 'zenity')
makedepends=('gnome-doc-utils' 'intltool')
options=('!libtool')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/linuxmint/${pkgname}/tarball/$pkgver")
md5sums=('0950fa5c00a165c7fed73b0898d072d5')

build() {
  cd linuxmint-${pkgname}-*

  autoreconf -vfi
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --libexecdir=/usr/lib/muffin \
              --localstatedir=/var \
              --disable-static
  make
}

package() {
  cd linuxmint-${pkgname}-*
  make DESTDIR=${pkgdir} install
}
