# Maintainer: Ray Rashif <schiv@archlinux.org>

pkgname=calf
pkgver=0.0.18.6
pkgrel=1
pkgdesc="LV2/DSSI/LADSPA plug-ins suite and standalone JACK host"
arch=('i686' 'x86_64')
url="http://calf.sf.net/"
license=('LGPL')
depends=('libglade' 'lash')
makedepends=('pkg-config' 'ladspa' 'dssi' 'lv2core')
source=(http://downloads.sf.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('780854561dad1cb873041d7a0b98cbcd')
sha1sums=('304585f5c99135914995efefc585fe7befee0985')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure	--prefix=/usr \
              --enable-experimental
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  rm "$pkgdir/usr/share/icons/hicolor/icon-theme.cache"
}

# vim:set ts=2 sw=2 et:
