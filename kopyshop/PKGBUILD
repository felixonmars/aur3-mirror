# Contributor: shamrok <szamrok@gmail.com>
# Previous Contributor: Jabir Ali Ouassou

pkgname=kopyshop
pkgver=0.1.10
pkgrel=1
pkgdesc="A simple KDE application to copy a sheet of paper, either to printer or a file"
url="http://www.kde-apps.org/content/show.php?content=34553"
license="GPL"
depends=('kdelibs' 'sane' 'kdegraphics')
source=(http://www.kde-apps.org/CONTENT/content-files/34553-$pkgname-$pkgver.tar.bz2)
md5sums=('38326fd452c1aa4399c381455e0a8ecc')
arch=('i686')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/opt/kde
  make || return 1
  make prefix=$startdir/pkg/opt/kde install
}
