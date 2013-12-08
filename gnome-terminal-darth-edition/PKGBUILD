# $Id$
# Maintainer: Alexander Seleznev <SeleznevRU@gmail.com>

pkgname=gnome-terminal-darth-edition
srcname=gnome-terminal
conflicts=gnome-terminal
provides=gnome-terminal
pkgver=3.10.2
pkgrel=1
pkgdesc="The GNOME Terminal Emulator, Darth edition"
arch=(i686 x86_64)
license=(GPL)
depends=(vte3 gsettings-desktop-schemas dconf)
makedepends=(gnome-doc-utils intltool itstool docbook-xsl desktop-file-utils gconf libnautilus-extension)
optdepends=('gconf: settings migration when upgrading from older version')
options=('!emptydirs')
url="http://www.gnome.org"
groups=('gnome')
install=gnome-terminal.install
source=(http://ftp.gnome.org/pub/gnome/sources/$srcname/${pkgver:0:4}/$srcname-$pkgver.tar.xz
        gnome-terminal-$pkgver-darth-edition.patch)
sha256sums=('e02827c29de45c09973483d821ab29ea60ab3fbba34b62a81d67b8304a9ad913'
            'd579e5419ef10827c7891d8e476d06693bb35fc4b236f31c97bce419e2214087')

build() {
  cd $srcname-$pkgver
  patch -up1 < ../../gnome-terminal-$pkgver-darth-edition.patch
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib/$pkgname --disable-static --with-nautilus-extension
  make
}

check() {
  cd $srcname-$pkgver
  make check
}

package() {
  cd $srcname-$pkgver
  make DESTDIR="$pkgdir" install
}
