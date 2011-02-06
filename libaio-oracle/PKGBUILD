pkgname=libaio-oracle
pkgver=0.3.0
pkgrel=2
pkgdesc="Oracle asynchoronous I/O thin wrapper library"
arch=('i686')
url="http://oss.oracle.com/projects/libaio-oracle/files/"
license=('LGPL')
depends=(libaio)
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
install=
source=("http://oss.oracle.com/projects/libaio-oracle/dist/files/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('165bbd6c75b8c1916e4b03988bafb372')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
