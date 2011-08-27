pkgname=cmigemo
pkgver=1.3c
pkgrel=1
pkgdesc="Japanese incremental search with Romaji (Compile with utf8)"
arch=('i686' 'x86_64')
url="http://www.kaoriya.net"
source=("http://www.kaoriya.net/dist/var/cmigemo-1.3c-MIT.tar.bz2" "configure.patch")
depends=()
makedepends=('perl' 'wget' 'gzip' 'nkf' 'gcc' 'tar')
license=('MIT')
md5sums=('e411e678985f42501982c050e959035f'
         'b4abbf94bef212ba0281d7a7fe97b545')

build()
{
  cp configure.patch "$srcdir/$pkgname-$pkgver-MIT"
  cd "$srcdir/$pkgname-$pkgver-MIT"
  patch < configure.patch
  ./configure
  make gcc
  make gcc-dict
  cd ./dict
  make utf-8
  cd ../
  make gcc-install
  cp -f ./dict/utf-8.d/* /usr/local/share/migemo/utf-8/
  cp -f ./build/cmigemo /usr/bin/
}
