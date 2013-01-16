# Maintainer: TDY <tdy@archlinux.info>

pkgname=xtell
pkgver=2.10.6
pkgrel=1
pkgdesc="A simple network messaging client, similar to netwrite"
arch=('i686' 'x86_64')
url="http://kassiopeia.juls.savba.sk/~garabik/software/xtell.html"
license=('GPL')
depends=('libident' 'readline')
source=(http://kassiopeia.juls.savba.sk/~garabik/software/xtell/xtell_$pkgver.tar.gz)
md5sums=('1cd2e3e0f8595df9b2fa3b05935fd18f')

build() {
  cd "$srcdir/xtell-$pkgver"
  make LDFLAGS="-lreadline -lident"
}

package() {
  cd "$srcdir/xtell-$pkgver"
  install -Dm755 xtell "$pkgdir/usr/bin/xtell"
  install -Dm644 xtell.1 "$pkgdir/usr/share/man/man1/xtell.1"
  install -Dm755 xtelld "$pkgdir/usr/sbin/xtelld"
  install -Dm644 xtelld.8 "$pkgdir/usr/share/man/man8/xtelld.8"
}

# vim:set ts=2 sw=2 et:
