# $Id: PKGBUILD 154430 2012-03-28 11:08:49Z heftig $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-terminal-dark
srcname=gnome-terminal
conflicts=gnome-terminal
provides=gnome-terminal
pkgver=3.4.0.1
pkgrel=1
pkgdesc="The GNOME Terminal Emulator, patched to use dark theme."
arch=('i686' 'x86_64')
license=('GPL')
depends=('gconf' 'vte3' 'gsettings-desktop-schemas' 'libsm')
makedepends=('gnome-doc-utils' 'intltool' 'gtk2')
options=('!emptydirs')
url="http://www.gnome.org"
groups=('gnome')
install=gnome-terminal.install
source=(http://ftp.gnome.org/pub/gnome/sources/$srcname/${pkgver:0:3}/$srcname-$pkgver.tar.xz 
        gnome-terminal.install 
        use-dark-theme.patch)
sha256sums=('1369298498d62993b075dc6d4b9669bbce1acb7ba1f670a0ba39e40a2a25a092'
            '90cb984aa758fe115c76cfd6e64d7b77e00731c1ad608720e1be4b5205ad5126'
            '3b6a8126163972b859e4835f97365411413e9c79f586d68ac195c037f526ac29')

build() {
  cd "$srcname-$pkgver"
   patch -up1 < ../../use-dark-theme.patch
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-scrollkeeper
  make
}

package() {
  cd "$srcname-$pkgver"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir" install

  install -m755 -d "$pkgdir/usr/share/gconf/schemas"
  gconf-merge-schema "$pkgdir/usr/share/gconf/schemas/$srcname.schemas" --domain gnome-terminal "$pkgdir"/etc/gconf/schemas/*.schemas
  rm -f "$pkgdir"/etc/gconf/schemas/*.schemas
}
