# Maintainer: ifaigios <ifaigios_at_gmail_dot_com>

pkgname=upower-git
pkgver=UPOWER_0_9_20.18.g04faa0e
pkgrel=2
pkgdesc="UPower from GIT master branch"
arch=('i686' 'x86_64')
url="http://upower.freedesktop.org"
license=('GPL')
depends=('systemd' 'polkit' 'dbus-glib' 'libimobiledevice')
makedepends=('intltool' 'gobject-introspection' 'systemd' 'gtk-doc' 'git')
provides=('upower=0.9.21' 'upower-git-systemd')
conflicts=('upower' 'upower-git-systemd')
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

  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib/upower \
    --disable-static

  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" install
}
