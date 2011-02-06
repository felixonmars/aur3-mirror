# Contributor: funkyou <spamopfer@nickname.berlin.de>
pkgname=khddledapplet
pkgver=1.0b
pkgrel=1
pkgdesc="A hdd activity led applet for KDE/Kicker"
url="ftp://upload.kde.org/incoming/kdeapps/Administration/Monitoring/System/kHddLED_Applet/"
license="GPL"
depends=('kdebase')
source=("ftp://upload.kde.org/incoming/kdeapps/Administration/Monitoring/System/kHddLED_Applet/$pkgname-$pkgver.tar.bz2")
md5sums=('d8a840c7a50a9313629bdff30b948753')

build() {
  cd $startdir/src/khddledappletkdehddledapplet/
  ./configure --prefix=/opt/kde
  make || return 1
  make DESTDIR=$startdir/pkg install
} 
