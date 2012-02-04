pkgname=msynctool-stable
pkgver=0.22
pkgrel=1
pkgdesc="CLI interface to OpenSync framework"
url="http://www.opensync.org"
license=(GPL)
arch=('i686' 'x86_64')
depends=('libopensync-stable')
conflicts=('msynctool=>0.22')
provides=('msynctool=0.22')
source=(http://www.opensync.org/download/releases/$pkgver/msynctool-$pkgver.tar.bz2)
md5sums=('3ddc55209e682a8b99a47cf3d0053dbf')

build() {
  cd $srcdir/msynctool-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install
}