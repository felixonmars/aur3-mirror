# Contributor: Joeny Ang <ang(dot)joeny(at)gmail(dot)com>

pkgname=gnome-bluetooth-git
_gitname=gnome-bluetooth
pkgver=20131121
pkgrel=1
pkgdesc="The GNOME Bluetooth Subsystem"
arch=('i686' 'x86_64')
url="http://live.gnome.org/GnomeBluetooth"
license=('GPL' 'LGPL')
depends=('gtk3' 'hicolor-icon-theme' 'libnotify' 'bluez')
#makedepends=('intltool' 'gnome-doc-utils' 'nautilus-sendto' 'gobject-introspection' 'gnome-common' 'git' 'automake' 'autoconf' 'yelp-tools')
makedepends=('intltool' 'gnome-common' 'gobject-introspection' 'gtk-doc' 'yelp-tools' 'git' 'automake' 'autoconf' 'nautilus-sendto')
options=('!libtool' '!emptydirs')
provides=('gnome-bluetooth')
conflicts=('gnome-bluetooth')
install=gnome-bluetooth.install
source=('git://git.gnome.org/gnome-bluetooth'
        '61-gnome-bluetooth-rfkill.rules')
md5sums=('SKIP'
         'dfe5e395a6e24672b1fe5cc1c27d120a')

pkgver() {
  cd ${_gitname}

  # Use the tag of the last commit
  # git describe --always | sed 's|-|.|g'
  
  # Use current date
  date +%Y%m%d
}

build() {
  cd ${_gitname}

  ./autogen.sh --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-desktop-update \
    --disable-icon-update \
    --disable-schemas-compile
  make
}

package() {
  cd ${_gitname}

  make DESTDIR=${pkgdir} install
  install -m644 -D "${srcdir}/61-gnome-bluetooth-rfkill.rules" \
    "${pkgdir}/usr/lib/udev/rules.d//61-gnome-bluetooth-rfkill.rules"
}
