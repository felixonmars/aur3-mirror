# Maintainer: Kasper Menten (gh0st) <echo ZGV2QGFudGktc3R1ZGlvLmV1Cg==|base64 -d>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=colord-unsane
_realname=colord
pkgver=1.2.9
pkgrel=1
pkgdesc="System daemon for managing color devices"
arch=(i686 x86_64)
url="http://www.freedesktop.org/software/colord"
license=(GPL2)
depends=(lcms2 libgusb polkit sqlite systemd dconf dbus)
makedepends=(intltool gobject-introspection vala docbook2x bash-completion
             argyllcms)
optdepends=('sane: scanner support'
            'argyllcms: color profiling')
replaces=('shared-color-profiles')
provides=('colord')
conflicts=('colord' 'colord-nopolkit')
install=colord.install
source=($url/releases/$_realname-$pkgver.tar.xz{,.asc})
sha1sums=('1b6319812b12ab7f906983959bbaaf2e5b78bdb7'
          'SKIP')
validpgpkeys=('163EB50119225DB3DF8F49EA17ACBA8DFA970E17')

build() {
  cd $_realname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib/$_realname --disable-static \
    --with-systemdsystemunitdir=/usr/lib/systemd/system \
    --enable-vala --enable-sane --with-daemon-user=colord
  make
}

package() {
  cd $_realname-$pkgver
  make DESTDIR="$pkgdir" install

  # the build system has no colord user, so the chown fails
  chown -R 124:124 "$pkgdir/var/lib/colord"
}

# vim:set ts=2 sw=2 et:
