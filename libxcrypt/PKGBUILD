# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=libxcrypt
pkgver=2.4
pkgrel=2
pkgdesc="Crypt Library for DES, MD5, and Blowfish"
arch=('i686' 'x86_64')
url="http://packages.debian.org/source/unstable/li"
license=('LGPL')
depends=('glibc')
install=libxcrypt.install
source=(http://ftp.de.debian.org/debian/pool/main/libx/$pkgname/${pkgname}_$pkgver.orig.tar.gz)
md5sums=('f0e42158b63a8944b465ebdadf82eadc')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make check || return 1
  make DESTDIR=$pkgdir install
  mkdir -p $pkgdir/lib
  mv $pkgdir/usr/lib/libxcrypt.so.* $pkgdir/lib/
  ln -sf ../../lib/libxcrypt.so.1 $pkgdir/usr/lib/libxcrypt.so
}
