# Contributor: jokele (kde@jokele.de)
#
# infokon is a KDE application which monitors the state of the Internet Storm Center
# INFOCon and loads the headlines of the Handler's Diary.
# http://isc.sans.org

pkgname=infokon
pkgver=0.1
pkgrel=3
pkgdesc="internet storm center status monitor"
url="http://www.jokele.de/infokon"
depends=('kdelibs')
license="GPL"
source=('http://www.kde-apps.org/content/download.php?content=63203&id=1#/'$pkgname-$pkgver.tar.gz)
md5sums=('753081b6833f883e7f229afa289ba2e1')
arch=('i686' 'x86_64')

build() {
  cd $startdir/src/$pkgname
  ./configure --prefix=/usr || return 1
  make || return 1
  mkdir -p $startdir/pkg/usr/bin
  make prefix=$startdir/pkg/usr install
}

