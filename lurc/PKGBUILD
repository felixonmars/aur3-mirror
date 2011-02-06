# Contributor: Christoph Zeiler <rabyte*gmail>
# Contributor: Lava Croft <lava.croft@trioptimum.com>

pkgname=lurc
pkgver=0.0.5.4
pkgrel=1
pkgdesc="An X11 IRC client derived from xchat 1.0 using the GTK+ toolkit"
arch=('i686' 'x86_64')
url="http://lurc.googlecode.com/"
license=('GPL')
depends=('gtk>=1.2')
makedepends=('cmake>=2.6')
source=($url/files/$pkgname-$pkgver.tar.bz2)
md5sums=('8857b698602c704729778a3d98e7fd7d')
 
build() {
  cd $pkgname-$pkgver

  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
}
