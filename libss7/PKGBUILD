# Maintainer: thiagoc <root@thiagoc.net>
pkgname=libss7
pkgver=2.0.0
pkgrel=1
pkgdesc="Userspace library that is used for providing SS7 protocol services to applications."
arch=('i686' 'x86_64')
license=('GPL2')
url="http://downloads.asterisk.org/pub/telephony/libss7"
source="http://downloads.asterisk.org/pub/telephony/libss7/$pkgname-$pkgver.tar.gz"
md5sums=('93e43adde507d622fd92898b66f8caef')
install=$pkgname.install

build() {
  cd "$pkgname-$pkgver/"
  sed -i "s/-Werror/-Wno-error/" Makefile
  make || return 1
}

package() {
  cd "$pkgname-$pkgver/"
  mkdir -p $pkgdir/usr/{include,lib}
  install -m 644 libss7.h $pkgdir/usr/include
  install -m 755 libss7.so.2.0 $pkgdir/usr/lib
  ( cd $pkgdir/usr/lib; \
    ln -sf libss7.so.2 libss7.so; \
    ln -sf libss7.so.2.0 libss7.so.2 )
  install -m 644 libss7.a $pkgdir/usr/lib
}

# vim:set ts=2 sw=2 et:
