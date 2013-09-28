# $Id$
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Rex Dieter <rdieter@fedoraproject.org>
# Maintainer: Antonis G. <capoiosct@gmail.org>

pkgname=compat-telepathy-farstream
_pkgname=telepathy-farstream
pkgver=0.4.0
pkgrel=1
pkgdesc="A telepathy-backend to use stream engine."
arch=('i686' 'x86_64')
url="http://telepathy.freedesktop.org"
license=('LGPL2.1')
depends=('telepathy-glib>=0.17.5' 'farstream-0.1>=0.1.0')
makedepends=('libxslt' 'gstreamer0.10-python' 'python2-gobject2')
conflicts=()
replaces=()
provides=()
options=('!libtool')
source=(http://telepathy.freedesktop.org/releases/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('52d110f8a9f27bce0a6c2c07e18aee56')

build() {
  cd "$_pkgname-$pkgver"

   ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/telepathy \
    --disable-static \
    --disable-python \
    --disable-gtk-doc-html
  make V=1
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  
  # HACK to make parallel-installable
  mv $pkgdir/usr/include/telepathy-1.0 \
  $pkgdir/usr/include/telepathy-1.0-compat
  mv $pkgdir/usr/lib/libtelepathy-farstream.so \
  $pkgdir/usr/lib/libtelepathy-farstream-0.4.so
  mv $pkgdir/usr/lib/pkgconfig/telepathy-farstream.pc \
  $pkgdir/usr/lib/pkgconfig/telepathy-farstream-0.4.pc
  sed -i \
  -e 's|-ltelepathy-farstream|-ltelepathy-farstream-0.4|' \
  -e 's|-I/usr/include/telepathy-1.0|-I/usr/include/telepathy-1.0-compat|' \
  $pkgdir/usr/lib/pkgconfig/telepathy-farstream-0.4.pc

  ## unpackaged files
  rm -fv $pkgdir/usr/lib/lib*.la
  rm -rfv $pkgdir/usr/share/gtk-doc/
}

# vim:set ts=2 sw=2 et:
