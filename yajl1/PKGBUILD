# Contributor: Dave Reisner <d@falconindy.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Andrej Gelenberg <andrej.gelenberg@udo.edu>

pkgname=yajl1
_pkgname=yajl
pkgver=1.0.12
pkgrel=4
pkgdesc='Yet Another JSON Library.'
arch=('i686' 'x86_64')
url='http://lloyd.github.com/yajl/'
license=('BSD')
makedepends=('cmake')
conflicts=()
provides=("yajl=$pkgver")
source=("$_pkgname-$pkgver.tar.gz::https://github.com/lloyd/$_pkgname/tarball/$pkgver")
md5sums=('70d2291638233d0ab3f5fd3239d5ed12')

build() {
  dirname=$(tar tf "$srcdir/$_pkgname-$pkgver.tar.gz" | sed 1q);
  cd "$dirname"
  sed -i '94s,),/yajl1),' src/CMakeLists.txt
  sed -i '95s,),/yajl1),' src/CMakeLists.txt
  sed -i '96s,),1/yajl),' src/CMakeLists.txt
  sed -i '97s,),1/yajl),' src/CMakeLists.txt
  sed -i 's,json_reformat ,yajl1_json_reformat ,' reformatter/CMakeLists.txt
  sed -i 's,json_verify ,yajl1_json_verify ,' verify/CMakeLists.txt


  cmake -DCMAKE_INSTALL_PREFIX=/usr .

  make
}

package() {
  dirname=$(tar tf "$srcdir/$_pkgname-$pkgver.tar.gz" | sed 1q);
  cd "$dirname"

  make DESTDIR="$pkgdir" install

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
