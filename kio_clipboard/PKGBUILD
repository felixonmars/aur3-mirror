# Contributor: Sascha Pfau <MrPeacock at gmail dot com>

pkgname=kio_clipboard
pkgver=0.1
pkgrel=2
pkgdesc="kio_clipboard is a kioslave to access the KDE clipboard"
url="http://kde-apps.org/content/show.php?content=48046"
license="LGPL"
depends=('kdelibs')
source=("http://kde-apps.org/CONTENT/content-files/48046-$pkgname-$pkgver.tar.bz2")
md5sums=('c8ea3b9ccf46c18caa3b76d90c745591')
arch=('i686')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/opt/kde
  make || return 1
  make DESTDIR=$startdir/pkg install
}
