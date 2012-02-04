# Contributor: Jessehk <hakuch@gmail.com>

pkgname=icepac
pkgver=0.3.1
pkgrel=1
pkgdesc="A very thin wrapper over ABS to ease package customization" 
arch=(i686 x86_64)
url="http://icepac.googlecode.com"
depends=('lua>=5.1')
makedepends=('glibc' 'pkgconfig')
license=(GPL)
install="icepac.install"
source=("http://icepac.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
md5sums=('a2b51e3cbb35e4a93624533d899550e7')


build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --libdir=/usr/lib/lua/5.1 --disable-static
  make || return 1
  make DESTDIR="$startdir/pkg" install || return 1
  
  install -D icepac.lua $startdir/pkg/usr/share/lua/5.1/icepac.lua
}
