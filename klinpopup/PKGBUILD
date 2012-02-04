# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=klinpopup
pkgver=0.3.4
pkgrel=4
pkgdesc="Program for sending and receiving Windows popup messages in Linux"
arch=(i686 x86_64)
url="http://www.gerdfleischer.de/klinpopup.php"
license="GPL"
depends=('kdelibs' 'smbclient')
install=klinpopup.install
source=(http://www.gerdfleischer.de/klinpopup/src/${pkgname}-${pkgver}.tar.bz2)
md5sums=('a1eb20f97802edd684a0a141d7b957c3')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}/

  # Source the KDE and QT profiles
  [ -f /etc/profile.d/kde.sh ] && source /etc/profile.d/kde.sh
  [ -f /etc/profile.d/qt.sh ] && source /etc/profile.d/qt.sh

  ./configure --prefix=/opt/kde --disable-debug
  make || return 1
  make DESTDIR=$startdir/pkg install
}
