# Maintainer: Maxime Gauduin <alucrydarchlinux.org>
# Contributor: Padfoot <padfoot@exemail.com.au>

pkgname=lightdm-gtk2-greeter
pkgver=1.8.5
pkgrel=1
pkgdesc='GTK+ greeter for LightDM (legacy)'
arch=('i686' 'x86_64')
url='https://launchpad.net/lightdm-gtk-greeter'
license=('GPL3' 'LGPL3')
depends=('gtk2' 'lightdm')
makedepends=('exo' 'gnome-common' 'gnome-doc-utils' 'gobject-introspection'
             'intltool')
conflicts=('lightdm-gtk-greeter')
backup=('etc/lightdm/lightdm-gtk-greeter.conf')
install='lightdm-gtk-greeter.install'
source=("https://launchpad.net/lightdm-gtk-greeter/${pkgver%.?}/${pkgver}/+download/lightdm-gtk-greeter-${pkgver}.tar.gz")
sha256sums=('22386e787dc64ac372c63cf2cdce47bfa1c791d1cf8b5d3df68df24ecfbf7d68')

build() {
  cd lightdm-gtk-greeter-${pkgver}

  ./configure \
    --prefix='/usr' \
    --libexecdir='/usr/lib/lightdm' \
    --sbindir='/usr/bin' \
    --sysconfdir='/etc' \
    --with-gtk2 \
    --disable-libido \
    --disable-libindicator \
    --disable-static
  make
}

package() {
  cd lightdm-gtk-greeter-${pkgver}

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
