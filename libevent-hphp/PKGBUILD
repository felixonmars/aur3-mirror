# Maintainer: Spider.007 <archPackage@spider007.net>
# Contributor: Spider.007 <archPackage@spider007.net>
pkgname=libevent-hphp
pkgver=1.4.14b
pkgrel=5
pkgdesc="Patched libevent for HipHop"
arch=('any')
url="http://wiki.github.com/facebook/hiphop-php/"
license=('custom')
depends=()
source=("https://github.com/libevent/libevent/archive/release-1.4.14b-stable.zip" "https://raw.github.com/facebook/hiphop-php/363d1bb20fe84b4cdc2dc0f4c7b1dd39d167a1f5/hphp/third_party/libevent-1.4.14.fb-changes.diff")
md5sums=('e855c2e2c0c6fa5c97bc1a7fed3b8260'
         'de8a9b7c061160ec82fb74b66c75df29')
 
build() {
  cd $srcdir/libevent-release-$pkgver-stable/
 
  CMAKE_PREFIX_PATH=/opt/hiphop
 
  patch < $srcdir/libevent-1.4.14.fb-changes.diff
  #sed -i 's/test\/Makefile//g' configure.in
  sed -i 's#/usr/bin/env python$#/usr/bin/env python2#' event_rpcgen.py
  ./autogen.sh
  ./configure --prefix=$CMAKE_PREFIX_PATH
 
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}
