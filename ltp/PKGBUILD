# Contributor: Lucas Hermann Negri <kkndrox@gmail.com>

pkgname=ltp
pkgver=1.0.4
pkgrel=3
pkgdesc="Lua template processor"
arch=('i686' 'x86_64')
url="http://www.savarese.com" 
depends=('lua>=5.1')
license=(APACHE)
source=("http://www.savarese.com/downloads/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=("9f4d59af1a887665b245aef2ea0883cb")

build() {
  mkdir "$startdir/src/$pkgname-$pkgver/build"
  cd "$startdir/src/$pkgname-$pkgver/build"
  
  ../configure --prefix=/usr || return 1
  make || return 1
  make install DESTDIR=${startdir}/pkg || return 1
  
  rm -rf "$startdir/src/$pkgname-$pkgver/build"
}
