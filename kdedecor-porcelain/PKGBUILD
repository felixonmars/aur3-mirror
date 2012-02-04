# Contributor: Max Bolotin <mogz@softhome.net>

pkgname=kdedecor-porcelain
pkgver=0.2
pkgrel=2
pkgdesc="a KDE window decoration"
url="http://www.kde-look.org/content/show.php/Porcelain?content=22689"
license="GPL"
depends=('kdebase' 'kdelibs')
source=(http://www.kde-look.org/CONTENT/content-files/22689-porcelain-$pkgver.tar.bz2)
md5sums=('7dda862fea37f35644cba96ce6076f6f')
 
build() {
  cd $startdir/src/porcelain-$pkgver
  ./configure --prefix=/opt/kde --with-qt-dir=/opt/qt
  make || return 1
  make DESTDIR=$startdir/pkg install
}
