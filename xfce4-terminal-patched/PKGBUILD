# $Id$
# Maintainer:  Guillaume Laville <laville.guillaume funnychar gmail.com>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: tobias <tobias funnychar archlinux.org>
# Contributor: Aurelien Foret <orelien@chez.com>

pkgname=xfce4-terminal-patched
_pkgname=xfce4-terminal
pkgver=0.6.2
pkgrel=2
pkgdesc="A modern terminal emulator primarly for the Xfce desktop environment (patched with Jeff Shipley improved URL matching)."
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
depends=('libxfce4ui' 'vte' 'hicolor-icon-theme')
makedepends=('intltool')
conflicts=('terminal' 'xfce4-terminal')
provides=('xfce4-terminal=0.6.2')
replaces=('terminal')
options=('!libtool')
install=$pkgname.install
source=(http://archive.xfce.org/src/apps/$_pkgname/0.6/$_pkgname-$pkgver.tar.bz2 Improve-URL-matching.patch)
sha256sums=('3d92422288d26311880af694bb4e02c9235997ca307a5e85001bf6bef65c3b35' '730221ad174ba08ea688cc3f90962da0f1fa449fce86d59d616169f9f484733d')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  
  patch -p1 < ../../Improve-URL-matching.patch
  
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var \
    --disable-static \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
