pkgname=packagekit
pkgver=1.0.4
pkgrel=1
pkgdesc="DBUS abstraction layer that allows the session user to manage packages in a secure way using a cross-distro, cross-architecture API"
arch=(i686 x86_64)
license=('GPL2')
url="http://www.packagekit.org/"
depends=(glib2 dbus-glib pam sqlite polkit systemd pacman python)
makedepends=(gtk3 gtk2 xmlto gtk-doc intltool bash-completion gobject-introspection python2)
options=('!libtool' 'emptydirs')
source=(http://www.freedesktop.org/software/PackageKit/releases/PackageKit-$pkgver.tar.xz)
sha256sums=('1b949a7dc92e20f7d7deb634e5b399148dbb749e813cea955f1546a99e169a71')

build() {
  cd PackageKit-$pkgver
  ./configure --prefix=/usr \
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
              --enable-alpm \
              --disable-tests \
              --disable-qt
  make
}

package() {
  cd PackageKit-$pkgver
  make DESTDIR="${pkgdir}" install

  #PackageKit initializes and upgrades this at runtime
  rm -f "${pkgdir}/var/lib/PackageKit/transactions.db"

  rm -rf "${pkgdir}/var/cache"
  rm -rf "${pkgdir}/var/log"
}

