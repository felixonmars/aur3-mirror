# $Id: PKGBUILD 184303 2013-05-05 19:21:38Z foutrelis $
# Maintainer of original pkg: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor to original pkg: tobias <tobias funnychar archlinux.org>
# Contributor to original pkg: Aurelien Foret <orelien@chez.com>
# Maintainer: ivdok <ivdok@yandex.ru>
pkgname=xfce4-terminal-fixencoding
pkgver=0.6.2
pkgrel=1
pkgdesc="A modern terminal emulator primarly for the Xfce desktop environment. Temporary version, build specifically for fixing bug 10395."
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
depends=('libxfce4ui' 'vte' 'hicolor-icon-theme')
makedepends=('intltool')
conflicts=('terminal')
replaces=('terminal')
options=('!libtool')
install=$pkgname.install
source=('https://dl.dropboxusercontent.com/u/20815718/xfce4-terminal-fixencoding-0.6.2.tar.bz2')
sha256sums=('SKIP')
sha512sums=('SKIP')
build() {
  cd "$srcdir/$pkgname-$pkgver"

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
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
