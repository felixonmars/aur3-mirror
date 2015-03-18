# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Yosef Or Boczko <yoseforb@gnome.org>

pkgname=gnome-software
pkgver=3.14.3
pkgrel=1
pkgdesc="GNOME Software Tools"
arch=(i686 x86_64)
license=('GPL2')
url="https://wiki.gnome.org/Apps/Software/"
depends=(gtk3 appstream-glib libsoup gsettings-desktop-schemas gnome-desktop packagekit desktop-file-utils archlinux-appstream-data)
makedepends=(intltool docbook-xsl)
options=('!libtool' '!emptydirs')
install=gnome-software.install
groups=('gnome-extra')
source=(http://download.gnome.org/sources/$pkgname/${pkgver:0:4}/$pkgname-$pkgver.tar.xz)
sha256sums=('69c4aaf4f518f0f780469cf60e5e20bb766e3eb6ce068c78dc06a260377f79ab')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --disable-static --disable-schemas-compile
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="${pkgdir}" install

  # Remove fedora-only plugins
  rm "${pkgdir}"/usr/lib/gs-plugins-*/libgs_plugin_fedora_tagger*
}

