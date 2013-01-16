# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: Jaroslav Lichtblau <tu@dragonlord.cz>
# Contributor: Raizen <flakeroats@hotmail.com>

pkgname=deskmenu
pkgver=1.4.5
pkgrel=1
pkgdesc="A desktop menu program activated by clicking the root window"
arch=('i686' 'x86_64')
url="http://www.oroborus.org/"
license=('GPL')
depends=('gtk2>=2.0.3')
backup=('etc/deskmenurc')
source=(http://ftp.debian.org/debian/pool/main/d/$pkgname/${pkgname}_$pkgver.tar.gz)
md5sums=('f471b9d4380e7cda5cdb935401d506a8')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 example_rc "$pkgdir/etc/deskmenurc"
}

# vim:set ts=2 sw=2 et:
