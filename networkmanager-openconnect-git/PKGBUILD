# Maintainer: josephgbr <rafael.f.f1@gmail.com>

pkgname=networkmanager-openconnect-git
pkgver=0.9.8.0.27.gf8781d8
pkgrel=1
pkgdesc="NetworkManager VPN integration for openconnect"
arch=('i686' 'x86_64')
url="http://www.gnome.org/projects/NetworkManager/"
license=('GPL')
depends=("networkmanager" 'openconnect' 'gconf' 'libgnome-keyring')
makedepends=('intltool' 'git')
optdepends=('network-manager-applet: GNOME frontends to NetWorkmanager')
provides=('networkmanager-openconnect')
conflicts=('networkmanager-openconnect')
options=('!libtool')
install=networkmanager-openconnect-git.install
source=('git://git.gnome.org/network-manager-openconnect')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/network-manager-openconnect
  git describe | sed 's/^v//;s/-/./g'
}

build() {
  cd "$srcdir"/network-manager-openconnect

  ./autogen.sh --prefix=/usr \
    --sysconfdir=/etc \
	--libexecdir=/usr/lib/networkmanager \
	--disable-static
  make
}

package() {
  cd "$srcdir"/network-manager-openconnect
  make DESTDIR=$pkgdir install
}
