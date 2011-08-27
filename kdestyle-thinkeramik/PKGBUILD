pkgname=kdestyle-thinkeramik
_pkgname=thinkeramik
pkgver=3.2.1
pkgrel=1
pkgdesc="a KDE theme based on keramik"
url="http://www.kde-look.org/content/show.php?content=10919"
license="GPL"
depends=(kdebase kdelibs)
source=(http://prefsx1.hp.infoseek.co.jp/tk040429/$_pkgname-$pkgver.tar.gz)
md5sums=(a151cd6ccba9376fb884d716ff4c4512)

build() {
  . /etc/profile.d/qt.sh
  cd $startdir/src/$_pkgname-$pkgver
  ./configure --prefix="`kde-config --prefix`"
  make || return 1
  make prefix=$startdir/pkg/opt/kde install

}
