# Contributor: Wes Brewer <brewerw@gmail.com>
pkgname=katalog
pkgver=0.4
pkgrel=3
pkgdesc="CD/DVD/Media Catalog for KDE using kioslaves integration"
arch=(i686)
url="http://salvaste.altervista.org/"
license=('GPL')
depends=('kdelibs' 'sqlite3' 'qt3')
makedepends=('python')
source=(http://salvaste.altervista.org/files/$pkgname-$pkgver.tar.gz)
md5sums=('c65c1edb10be4c6db06d56d73837619d')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
