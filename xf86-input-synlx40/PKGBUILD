# Maintainer: Sergey Mosin <serge at sergem.org>

pkgname=xf86-input-synlx40
pkgver=0.2.0
pkgrel=1
pkgdesc="Clickpad driver for Lenovo XX40(T540/T440/X240/E440 etc) series laptops"
arch=('x86_64')
url="https://github.com/SergeyMosin/$pkgname"
license=('MIT')
depends=('mtdev' 'libevdev' 'libxtst')
makedepends=('git' 'xorg-server' 'libx11' 'libxi' 'resourceproto' 'scrnsaverproto' 'xorg-server-devel')
conflicts=('xf86-input-synaptics')

source=($url/archive/master.tar.gz)
md5sums=('6644e3f0b89dc4adfcd907549325560e')

build() {
#  cd "$srcdir"/$pkgname-$pkgver
  cd "$srcdir"/$pkgname-master

  mkdir -p m4

  autoreconf --install
  ./configure --prefix=/usr
  make
}

package() {
#  cd "$srcdir"/$pkgname-$pkgver
  cd "$srcdir"/$pkgname-master

  make DESTDIR="$pkgdir"/ install

}
