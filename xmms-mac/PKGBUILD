# Contributor: Giorgio Gilestro <giorgio@gilest.ro>

pkgname=xmms-mac
pkgver=0.3.1
pkgrel=2
pkgdesc="XMMS plugin for Monkeys audio files"
arch=('any')
url="http://public.www.planetmirror.com/pub/sf/m/ma/mac-port/"
license="GNU LGPL"
depends=('xmms' 'mac')
groups=('xmms-plugins' 'xmms-io-plugins')
options=(!libtool)
source=(http://repository.slacky.eu/slackware-12.0/multimedia/xmms-mac/$pkgver/src/$pkgname-$pkgver.tar.gz)

md5sums=('7a4be5e3433c68f155f5b2913e4f21ba')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}

