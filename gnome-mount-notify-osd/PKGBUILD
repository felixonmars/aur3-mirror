# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Original-Package: gnome-mount
# Maintainer: Jan de Groot <jgc@arclinux.org>

pkgname=gnome-mount-notify-osd
_realname=gnome-mount
pkgver=0.8
pkgrel=2
pkgdesc="GNOME mount program"
arch=(i686 x86_64)
license=('GPL')
url="http://hal.freedesktop.org/"
depends=('gnome-keyring>=2.22.1' 'libnotify>=0.4.4')
makedepends=('pkgconfig' 'perlxml' 'nautilus>=2.22.2')
options=('!libtool' '!emptydirs')
groups=('gnome')
conflicts=(gnome-mount)
provides=(gnome-mount)
install=gnome-mount.install
source=(http://hal.freedesktop.org/releases/${_realname}-${pkgver}.tar.gz
        use_window_for_flushing.patch)

build() {
  cd "${srcdir}/${_realname}-${pkgver}"
  patch -p1 < ../use_window_for_flushing.patch || return 1
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static || return 1
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install || return 1

  install -m755 -d ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${_realname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas || return 1
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
md5sums=('562ec9d0196e5e000bdd249a04a3aa6a'
         '21d7e59f43d1cf2a52aaf3a9a7b32794')
