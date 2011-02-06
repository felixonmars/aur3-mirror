# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Jari Huilla <jari.huilla@tut.fi>

pkgname=ipodfs
pkgver=0.5
pkgrel=3
pkgdesc="A user-space filesystem providing simple access to iPods using FUSE"
arch=('i686' 'x86_64')
url="http://rich.phekda.org/ipodfs/"
license=('LGPL')
depends=('libgpod' 'fuse')
source=($url/$pkgname-$pkgver.tar.bz2)
md5sums=('a101354fb72b43054dd9505bb13ad8f8')

build() {
  cd $pkgname-$pkgver

  sed '/CFLAGS += -g/d' -i Makefile

  make LDFLAGS= || return 1
  make prefix=/usr DESTDIR="$pkgdir" install
}
