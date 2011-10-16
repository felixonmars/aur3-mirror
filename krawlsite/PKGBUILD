# Contributor: Max Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: Thomas Karmann <thomas@karmann-paf.de>
# Contributor: shamrok <szamrok@gmail.com>

pkgname=krawlsite
pkgver=0.7
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="A web crawler,spider, offline browser and download manager application for KDE"
url="http://kde-apps.org/content/show.php?content=18617"
depends=('kdelibs3' 'qt3')
license=("GPL")
source=("http://www.kde-apps.org/CONTENT/content-files/18617-$pkgname-$pkgver.tar.bz2")
md5sums=('6d2fdb72e96dd23c273f336a1f73a380')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --with-qt-dir=/opt/qt --prefix=/opt/kde --without-arts
  make
}

package() {
  make DESTDIR="$pkgdir" install
}
