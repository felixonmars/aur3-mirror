
# Contributor: Sascha Bennek <s.bennek@gmx.de>
pkgname=giftui
pkgver=0.4.1
pkgrel=2
pkgdesc="Tabbed based GTK+ Frontend for the giftd deamon"
arch=(i686)
url="http://giftui.sourceforge.net/"
license=('GPL2')
depends=('glibc>=2.4-1' 'gconf>=2.13.5' 'gift>=0.11.8.1' 'gtk2>=2.10.0' 'orbit2>=2.10.0')
makedepends=('pkgconfig' )
install=giftui.install
source=(http://surfnet.dl.sourceforge.net/sourceforge/giftui/$pkgname-$pkgver.tar.bz2)
md5sums=('de834779fde3f2edb002631f4110f1b9')
build() {
  cp $startdir/0.4.1-gentoo-r1.patch $startdir/src/$pkgname-$pkgver/src
  cd "$startdir/src/$pkgname-$pkgver"
  ./configure --prefix=/usr
  patch -p1 src/ui_transfer_cb.c src/0.4.1-gentoo-r1.patch
  make || return 1
  make DESTDIR="$startdir/pkg" install
}

# vim:set ts=2 sw=2 et:
