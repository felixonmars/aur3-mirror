# Maintainer: abutment <iain@sphinx.mythic-beasts.com>
pkgname=blame
pkgver=1.3.1
pkgrel=1
pkgdesc="RCS annotation utility"
depends=('glibc')
license=(GPL)
arch=(i686)
source=("http://prdownloads.sourceforge.net/blame/$pkgname-$pkgver.tar.gz?download")
url="http://blame.sourceforge.net/"
md5sums=(7e63b28b5c2bc6bed2b30891a619c29c)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
