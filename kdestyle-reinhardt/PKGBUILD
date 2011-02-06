#Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org

pkgname=kdestyle-reinhardt
pkgver=0.8.2
pkgrel=1
pkgdesc="KDE style based very heavily on clee's dotNET style"
url="http://www.kde-look.org/content/show.php?content=5962"
license=""
depends=('qt')
makedepends=('kdelibs')
source=(http://dl.sourceforge.net/sourceforge/reinhardtstyle/reinhardtstyle-$pkgver.tar.bz2)
md5sums=('12e6b54bf5463c12550274e866756272')

build() {
  cd $startdir/src/reinhardtstyle-$pkgver
  ./configure --prefix=/opt/kde
  make || return 1
  make prefix=$startdir/pkg/opt/kde install
}
