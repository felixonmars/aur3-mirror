# Author: Yosef Or Boczko <yoseforb@gnome.org>
# Contributor: Britt <bwyazel at gmail dot com>


_pkgname=packagekit
pkgname=$_pkgname-test
pkgver=1.0.0
pkgrel=1
_realver=1.0.0
pkgdesc="*Unofficial Test Version* - Install at own Risk - PackageKit package manager framework"
arch=(i686 x86_64)
license=('GPLv2')
url="http://www.packagekit.org/"
depends=("glib2" "dbus-glib" "pam" "sqlite" "networkmanager" "polkit"
	 "gtk3" "gtk2" "python" "systemd" "pacman>=4.1.0")
makedepends=("xmlto" "gtk-doc" "intltool" "bash-completion")
options=('!libtool' '!emptydirs')
conflicts=("packagekit")
replaces=("packagekit")
provides=("packagekit=$_realver")
source=('http://www.freedesktop.org/software/PackageKit/releases/PackageKit-1.0.0.tar.xz')
sha256sums=('2b7d7af178431391f64a118a0d693106e9603b9db7bcf0f9cde5c5d62a0b60bf')



build() {
  cd "$srcdir/PackageKit-$pkgver"
  ./autogen.sh --prefix=/usr \
               --sysconfdir=/etc \
               --localstatedir=/var \
               --libexecdir=/usr/lib/PackageKit \
               --disable-static \
               --disable-schemas-compile \
               --disable-browser-plugin \
               --enable-gtk-doc \
               --enable-python3 \
               --enable-systemd \
               --enable-systemd-updates \
               --enable-gstreamer-plugin \
               --enable-alpm
  make
}

package() {
  cd "$srcdir/PackageKit-$pkgver"
  make DESTDIR="${pkgdir}" install
}
