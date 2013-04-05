# Maintainer: ifaigios <ifaigios_at_gmail_dot_com>

pkgname=upower-git-systemd
pkgver=UPOWER_0_9_20.13.g09fa9d5
pkgrel=1
pkgdesc="UPower from GIT master branch, with no pm-utils dependency"
arch=('i686' 'x86_64')
url="http://upower.freedesktop.org"
license=('GPL')
depends=('systemd' 'libusb' 'polkit' 'dbus-glib' 'libimobiledevice')
makedepends=('intltool' 'gobject-introspection' 'systemd' 'gtk-doc' 'git')
provides=('upower=0.9.20' 'upower-git')
conflicts=('upower' 'upower-git')
options=('!libtool')
source=(git://anongit.freedesktop.org/upower)
md5sums=('SKIP')
_gitname="upower"

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --always | sed 's|-|.|g'#
}

build() {
  cd "$srcdir/$_gitname"

  export NOCONFIGURE="true"
  ./autogen.sh

  # put udev files in /usr/lib
  sed -i "/slashlibdir=/s#/lib#/usr/lib#" configure

  ./configure --prefix=/usr --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib/upower \
    --disable-static

  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" install
}
