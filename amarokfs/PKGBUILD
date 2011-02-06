# Contributor: Nicolas Quiénot <niQo@aur>
# Contributor: Johannes Schriewer <jschriewer@arcor.de>

pkgname=amarokfs
pkgver=0.5
pkgrel=3
pkgdesc="Fullscreen frontend for Amarok 1"
url="http://www.kde-apps.org/content/show.php?content=52641"
license="GPL"
depends=('python' 'kdelibs3')
optdepends=('amarok1: amarokFS is made for amarok 1.X')
options=('!libtool')
arch=('i686' 'x86_64')
source=('http://www.kde-apps.org/CONTENT/content-files/52641-amarokFS-0.5.tar.gz' 'amarokFS-0.5-FixMountPointIdQuery.patch' 'amarokFS-arch.patch')
md5sums=('28b7432fa9abfb0a2211940990b3945a' '3bee0236b1b43a5410839c7345213828' 'a89853e4a9a07afd6fefd196888ab02d')

build() {
  cd $srcdir/amarokFS-$pkgver
  mkdir -p $pkgdir/opt/kde
  #arch patch
  patch -p1 < ../amarokFS-arch.patch || return 1
  #cover fix	
  patch -p1 < ../amarokFS-0.5-FixMountPointIdQuery.patch || return 1
  
  [ -f /etc/profile.d/qt3.sh ] && source /etc/profile.d/qt3.sh
  ${QTDIR}/bin/qmake || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install
}

