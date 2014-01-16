#Maintainer: Bishmer J. Sekaran <bishmer[AT]scorpionrock.com>
#Contributor: Jove Yu <yushijun110[AT]gmail.com>

pkgname=gnome-terminal36
_pkgname=gnome-terminal
pkgver=3.6.2
pkgrel=1
pkgdesc="The GNOME Terminal Emulator 3.6.2 version"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gconf' 'vte3' 'gsettings-desktop-schemas' 'libsm')
makedepends=('gnome-doc-utils' 'intltool' 'gtk2' 'itstool' 'docbook-xsl')
provides=('gnome-terminal' )
conflicts=('gnome-terminal')
options=('!emptydirs')
url="http://www.gnome.org"
groups=('gnome')
install=gnome-terminal.install
source=(http://ftp.gnome.org/pub/gnome/sources/$_pkgname/${pkgver:0:3}/$_pkgname-$pkgver.tar.xz)
sha256sums=('2df2f07c5dae9b2bb85ab75be249a285f97197ca954e9b80d8babf65832c416c')

build() {
  cd "$_pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-scrollkeeper
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir" install

  install -m755 -d "$pkgdir/usr/share/gconf/schemas"
  gconf-merge-schema "$pkgdir/usr/share/gconf/schemas/$_pkgname.schemas" --domain gnome-terminal "$pkgdir"/etc/gconf/schemas/*.schemas
  rm -f "$pkgdir"/etc/gconf/schemas/*.schemas
}
