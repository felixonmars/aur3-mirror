pkgname=ortp
pkgver=0.23.0
pkgrel=1
pkgdesc="oRTP is a LGPL licensed C library implementing the RTP protocol (rfc3550)"
arch=(i686 x86_64)
url="http://www.linphone.org/"
license=('LGPL2')
options=(!libtool)
depends=('openssl' 'libsrtp')
conflicts=('ortp')
provides=('ortp')

source=("http://download.savannah.gnu.org/releases/linphone/$pkgname/sources/$pkgname-$pkgver.tar.gz"{,.sig})

build() {
  cd $srcdir/$pkgname-$pkgver
  ./autogen.sh || return 1
  ./configure --prefix=/usr || return 1
  make || return 1
}
package(){
  make -C $srcdir/$pkgname-$pkgver DESTDIR=$pkgdir install || return 1
}

md5sums=('fb833cc7a66ec1a0c1b75016130e7e6d'
         'SKIP')
# vim: set ft=PKGBUILD
