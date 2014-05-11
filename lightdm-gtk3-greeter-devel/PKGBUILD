# Maintainer: Padfoot <padfoot at exemail dot com dot au>
# Contributor: Alucryd <alucryd at gmail dot com>

pkgname=lightdm-gtk3-greeter-devel
pkgver=1.8.5
pkgrel=2
pkgdesc="GTK3+ greeter for LightDM"
arch=('i686' 'x86_64')
url="https://launchpad.net/lightdm-gtk-greeter"
license=('GPL3' 'LGPL3')
depends=('gtk3' 'lightdm')
makedepends=('exo' 'gnome-doc-utils' 'gobject-introspection' 'intltool')
provides=("lightdm-gtk-greeter=${pkgver}")
conflicts=('lightdm-gtk-greeter')
backup=('etc/lightdm/lightdm-gtk-greeter.conf')
source=("https://launchpad.net/lightdm-gtk-greeter/1.8/${pkgver}/+download/lightdm-gtk-greeter-${pkgver}.tar.gz")
sha256sums=('22386e787dc64ac372c63cf2cdce47bfa1c791d1cf8b5d3df68df24ecfbf7d68')

build() {
  cd "${srcdir}"/lightdm-gtk-greeter-${pkgver}

  ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --libexecdir=/usr/lib/lightdm --disable-static
  make
}

package() {
  cd "${srcdir}"/lightdm-gtk-greeter-${pkgver}

  make DESTDIR="${pkgdir}" install  
}
