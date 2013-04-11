# $Id: PKGBUILD 182464 2013-04-10 19:11:48Z heftig $
# Maintainer: Ionut Biru <ibiru@archlinux.org>

pkgname=empathy-utf8-logs
_pkgname=empathy
pkgver=3.8.0
pkgrel=1
pkgdesc="A GNOME instant messaging client using the Telepathy framework. Reverted back UTF8 log support."
arch=(i686 x86_64)
url="http://live.gnome.org/Empathy"
license=(GPL2)
conflicts=(empathy)
provides=(empathy)
depends=(clutter-gst clutter-gtk folks gcr iso-codes libcanberra libpulse webkitgtk3 telepathy-farstream telepathy-glib telepathy-logger telepathy-mission-control)
makedepends=(intltool itstool docbook-xsl python2)
optdepends=('telepathy-gabble: XMPP/Jabber support'
            'telepathy-idle: IRC support'
            'telepathy-salut: Link-local XMPP support'
            'telepathy-rakia: SIP support'
            'telepathy-haze: libpurple support')
options=('!libtool' '!makeflags')
groups=(gnome)
install=empathy.install
source=(http://ftp.gnome.org/pub/GNOME/sources/$_pkgname/${pkgver:0:3}/$_pkgname-$pkgver.tar.xz
log-escape.patch::https://bug691085.bugzilla-attachments.gnome.org/attachment.cgi?id=232735)
sha256sums=(
    '3b2fe5fd41ceadeeda08735ecbccfc344b5d6c7009e40e289d175bc7cac69069'
    '647745dd61a3ced190cb1616fd68b98ca5cd607c7f697f5d5175a56373166415')

build() {
  cd $_pkgname-$pkgver
  patch -R -p1 < ../log-escape.patch 
  PYTHON=/usr/bin/python2 ./configure --prefix=/usr \
      --sysconfdir=/etc  \
      --libexecdir=/usr/lib/empathy \
      --disable-static
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
