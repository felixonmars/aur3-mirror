# Maintainer: Stefano Facchini <stefano.facchini@gmail.com>
# Contributer: Ellis Kenyo <elken.tdos@gmail.com>
pkgname=gnome-boxes
pkgver=3.12.0
pkgrel=3
pkgdesc="A simple GNOME 3 application to access remote or virtual systems"
arch=('i686' 'x86_64')
url="http://live.gnome.org/Boxes"
license=('LGPL2.1')
depends=('gtk3' 'clutter-gtk' 'spice-gtk3' 'libvirt-glib' 'tracker'
         'gtk-vnc' 'udev' 'libosinfo' 'dconf' 'hicolor-icon-theme'
         'desktop-file-utils' 'shared-mime-info' 'vala' 'spice-protocol')
optdepends=('qemu-spice: to create new VMs')
makedepends=('intltool' 'itstool')
install=gnome-boxes.install
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver:0:4}/$pkgname-$pkgver.tar.xz)
sha256sums=('fbeac187fefd5fc825beda058e1f25731949bd2e32a1754acfc5fe3dc1edc9ae')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --libexec=/usr/lib/gnome-boxes
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
