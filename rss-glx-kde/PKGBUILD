# Contributor: mightyjaym <jmambrosino@gmail.com>

pkgname=rss-glx-kde
pkgver=1.1
pkgrel=1
pkgdesc="KDE integration for the rss-glx screensaver package"
arch=('i686' 'x86_64')
url="http://rss-glx.sourceforge.net/"
license="GPL"
depends=('rss-glx')
source=(http://jm.ambrosino.free.fr/archlinux/_source/$pkgname-$pkgver.tar.gz)
md5sums=('88b075ec6643602c8e646340aaf090f4')

build() {

mkdir -p $pkgdir/usr/share/kde4/services/ScreenSavers
cd $srcdir
cp *.desktop $pkgdir/usr/share/kde4/services/ScreenSavers/

}