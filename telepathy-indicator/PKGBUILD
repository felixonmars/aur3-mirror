# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=telepathy-indicator
pkgver=0.3.0
pkgrel=2
pkgdesc="Telepathy integration with the messaging menu"
arch=('i686' 'x86_64')
url="https://launchpad.net/telepathy-indicator"
license=('GPL')
depends=('indicator-messages' 'telepathy-glib' 'libunity')
makedepends=('intltool')
source=(http://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz
        http://pkgbuild.com/~bgyorgy/sources/$pkgname-translations-20130310.tar.gz)
md5sums=('25eecc33346a0121a3303b5897410db9'
         '592a88d52e4a75c6adc6e571a057b096')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Install updated language files
  rename $pkgname- '' ../po/$pkgname-*.po
  mv -f -t po ../po/*
  printf "%s " po/*.po | sed -e 's/po\///g' -e 's/\.po//g' >po/LINGUAS

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-static
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
