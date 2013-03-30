# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: Ashok Gautham <ScriptDevil@gmail.com>

pkgname=giver
pkgver=0.1.8
pkgrel=2
pkgdesc="A simple file sharing application"
arch=('i686' 'x86_64')
url="http://giver.googlecode.com/"
license=('MIT')
depends=('avahi' 'gnome-sharp' 'notify-sharp')
makedepends=('intltool>=0.35.0' 'pkgconfig>=0.9.9')
install=giver.install
source=(http://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.gz)
sha256sums=('0fe08f6c08896029b859bcf66720b50013a1e1a672141a782667db6c9d889b8d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure  --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
