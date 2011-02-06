# Contributor: shamrok <szamrok@gmail.com>

pkgname=kpv
pkgver=0.3.3
pkgrel=1
pkgdesc="This is small process viewer and manager for KDE kicker."
arch=('i686' 'x86_64')
url="http://ksquirrel.sourceforge.net/subprojects.php"
license=('GPL')
depends=('kdelibs')
source=("http://downloads.sourceforge.net/ksquirrel/kprocessviewer-$pkgver.tar.bz2")
md5sums=('f28e79666e635f35d757a9c2cb26afab')

build() {
  cd $startdir/src/kprocessviewer-$pkgver
  ./configure
  make || return 1
  make DESTDIR=$startdir/pkg install
}
