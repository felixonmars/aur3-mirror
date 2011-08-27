# Maintainer: 
# Contributor: Judd <jvinet@zeroflux.org>
# Contributor: Nicolas <niQo@ aur> 

pkgname=libevent1
_origpkgname=libevent
pkgver=1.4.14b
pkgrel=1
pkgdesc="Libevent V1"
license=('GPL2')
arch=('i686' 'x86_64')
url="http://www.monkey.org/~provos/libevent/"
depends=('glibc')
provides=('libevent=1.4.14b')
replaces=('libevent')
conflicts=('libevent')
source=("http://www.monkey.org/~provos/libevent-$pkgver-stable.tar.gz")
options=('!libtool')
md5sums=('a00e037e4d3f9e4fe9893e8a2d27918c')

build() {
  cd $srcdir/$_origpkgname-$pkgver-stable
  sed -i 's#python#python2#' event_rpcgen.py
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
}

package() {
  cd $srcdir/$_origpkgname-$pkgver-stable
  make DESTDIR=$pkgdir install || return 1
}
