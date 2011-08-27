# Contributor: lp76 <l.peduto@gmail.com>
pkgname=cmdftp
pkgver=0.9.7
pkgrel=2
pkgdesc="A command line FTP client for Unix"
url="http://www.nongnu.org/cmdftp/"
license=('GPL')
arch=('i686' 'x86_64')
source=(http://download.savannah.nongnu.org/releases/cmdftp/$pkgname-$pkgver.tar.gz)
md5sums=('9bd0741bbb1f218be95c089dc06b2777')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
