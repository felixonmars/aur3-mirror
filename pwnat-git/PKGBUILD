# Maintainer: Tatsuyuki Ishi <ishitatsuyuki at gmail dot com>
pkgname=pwnat-git
pkgver=0.3.1d07c2e
pkgrel=1
pkgdesc="A tool to connect server and client under NAT"
arch=('i686' 'x86_64')
url="http://samy.pl/pwnat/"
license=('GPL3')
depends=('glibc')
makedepends=('git')
provides=('pwnat')
conflicts=('pwnat')
replaces=('pwnat')
source=(${pkgname}::git+https://github.com/samyk/pwnat)
md5sums=('SKIP') 

build() {
  cd ${srcdir}/${pkgname}
  make
}

package() {
  cd ${srcdir}/${pkgname}
  install -Dm755 pwnat $pkgdir/usr/bin/pwnat
  install -m644 -D README $pkgdir/usr/share/doc/$pkgname/README
  install -m644 -D README-udptunnel $pkgdir/usr/share/doc/$pkgname/README-udptunnel
}

# vim:set ts=2 sw=2 et: