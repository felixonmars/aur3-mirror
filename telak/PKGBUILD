# Maintainer : speps <dreamspepser at yahoo dot it>
# Contributor: TDY <tdy@gmx.com>

pkgname=telak
pkgver=0.6
pkgrel=1
pkgdesc="A small tool to draw local or remote pictures on your root window"
arch=('i686' 'x86_64')
url="http://julien.danjou.info/software/telak/"
license=('GPL')
depends=('curl' 'imlib2' 'libgcrypt')
#source=(http://julien.danjou.info/$pkgname/$pkgname-$pkgver.tar.gz)
source=("https://github.com/jd/telak/archive/v$pkgver.tar.gz")
install="$pkgname.install"
md5sums=('cf74a689e7e0324d25eebc8f6aa068c0')

prepare() {
  cd $pkgname-$pkgver

  # DSO link fix
  sed -i '/^LDFLAGS/s/$/ -lX11/' Makefile
}

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  # sample rc file
  install -Dm644 telakrc.sample \
    "$pkgdir/usr/share/$pkgname/telakrc.sample"
}
