# Maintainer: Oskar Duwe <oskar.einstein@gmail.com>
# Based on PKGBUILD made by Jan de Groot

pkgname=nautilus-up
pkgver=3.4.2
pkgrel=1
pkgdesc="Nautilus with patch to add up button"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libexif' 'gnome-desktop' 'exempi' 'gvfs' 'desktop-file-utils' 'gnome-icon-theme' 'dconf' 'libtracker-sparql' 'libnotify')
makedepends=('intltool' 'gobject-introspection')
url="http://ubuntuforums.org/showthread.php?t=1904510"
groups=('gnome')
options=('!libtool' '!emptydirs')
provides=('nautilus')
conflicts=('nautilus')
install=nautilus.install
source=("http://ftp.gnome.org/pub/gnome/sources/nautilus/${pkgver%.*}/nautilus-${pkgver}.tar.xz" "nautilus-up_button-patch.patch")
sha256sums=('752afa41189b0b6c73dc3769cd885e184c29d6d394345ec05cd48b0004e0f452' 
            'ed2a3eff837d9b65bf6d14155d332e3260ba735a5c19d2b6117f10a1a7166e39')

build() {
  cd "nautilus-$pkgver"
  patch -Np1 -i "$srcdir/nautilus-up_button-patch.patch"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --libexecdir=/usr/lib/nautilus \
      --disable-nst-extension \
      --disable-update-mimedb \
      --disable-packagekit \
      --disable-schemas-compile
  make
}

package() {
  cd "nautilus-$pkgver"
  make DESTDIR="$pkgdir" install
}
