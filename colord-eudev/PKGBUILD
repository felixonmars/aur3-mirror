# $Id: PKGBUILD 191316 2013-07-23 14:05:15Z jgc $
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=colord-eudev
pkgver=1.0.6
pkgrel=1
pkgdesc="System daemon for managing color devices"
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/software/colord"
license=(GPL2)
depends=('lcms2' 'libgusb' 'polkit' 'shared-color-profiles' 'sqlite' 'udev' 'dconf' 'dbus')
makedepends=('intltool' 'gobject-introspection' 'vala' 'docbook2x' 'sane' 'bash-completion')
optdepends=('sane: UseSANE support [/etc/colord.conf]')
provides=('colord')
conflicts=('colord')
options=('!libtool')
install=colord.install
backup=('etc/colord.conf')
source=("$url/releases/colord-$pkgver.tar.xz")

build() {
  cd colord-$pkgver

  # put udev files in /usr/lib
  sed -i "/slashlibdir=/s#/lib#/usr/lib#" configure

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib/colord \
    --disable-static \
    --enable-vala \
    --enable-sane \
    --disable-volume-search \
    --disable-systemd-login
  make
}

package() {
  cd colord-$pkgver
  make DESTDIR="$pkgdir" install
}
sha256sums=('a40bbceaa3d3b1d6fd2777b181bf641b4eb49ad249796823585136c146ad7e8e')
