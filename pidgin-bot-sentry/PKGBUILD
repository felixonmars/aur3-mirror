# Contributor: Sergey Tereschenko <serg.partizan@gmail.com>

pkgname=pidgin-bot-sentry
pkgver=1.3.0
pkgrel=2
pkgdesc="Pidgin plugin to prevent IM spam"
arch=('i686' 'x86_64')
url="http://pidgin-bs.sourceforge.net/"
license=('GPL')
depends=('pidgin')
makedepends=('intltool>=0.40.0')
options=('!libtool')
md5sums=('81ed178b982fbaa176c96da792464e43')

source=("http://downloads.sourceforge.net/pidgin-bs/bot-sentry-$pkgver.tar.bz2") 

build() {
  cd  $startdir/src/bot-sentry-$pkgver
  ./configure
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
