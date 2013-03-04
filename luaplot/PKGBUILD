# Contributor: Lucas Hermann Negri <lucashnegri@gmail.com>

pkgname=luaplot
pkgver=0.3.0
pkgrel=1
pkgdesc="Plotting library for Lua."
arch=('i686' 'x86_64')
url="http://oproj.tuxfamily.org" 
depends=('lua>=5.1' 'cairo>1.6' 'lgob')
license=(LGPL)
source=("http://downloads.tuxfamily.org/oproj/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=("1b2912646759611cefd89d4f87245c89")

build() { 
  cd "$srcdir/$pkgname-$pkgver"
  make install DESTDIR=$pkgdir/usr || return 1
}
