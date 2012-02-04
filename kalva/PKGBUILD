# Maintainer: Rene Wiermer <rwiermer@gpooglemail.com>

pkgname=kalva
pkgver=0.8.81
pkgrel=1
pkgdesc="A TV watching and recording application. Uses MEncoder."
arch=(i686 x86_64)
url="http://kalva.berlios.de/"
depends=(kdelibs at cron mplayer perl-config-crontab)
makedepends=
install=$pkgname.install
source=(http://download.berlios.de/$pkgname/$pkgname-$pkgver.tar.bz2 $pkgname.install)

md5sums=('dee229f203cce57c57e9dff45e659fe8' '38a3ab8c868ce534152d335bee742387')
build() {
  cd ${startdir}/src/${pkgname}-${pkgver}/
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
