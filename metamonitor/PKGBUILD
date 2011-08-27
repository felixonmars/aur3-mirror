# PKGBUILD written by 3ED

pkgname=metamonitor
pkgver=0.4
pkgrel=1
pkgdesc=" MetaMonitor is a simple program written for KDE, which watches the syslog's or metalog's log file and pops up the window whenever the new message comes."
depends=('kdelibs' 'kdebase>=3.0')
source=(http://switch.dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2)
url="http://metamonitor.sourceforge.net/"
md5sums=('0731b95be4585eaab6d314190eb95b12')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/opt/kde
  make || return 1
  make DESTDIR=$startdir/pkg install
}
