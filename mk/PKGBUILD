# $Id: $
# Maintainer:  Russ Cox <rsc@swtch.com>
# Contributor: Kai Hendry <hendry@iki.fi>
pkgname=mk
pkgver=0.1
pkgrel=1
pkgdesc="plan9 make"
arch=(i686 x86_64)
url="http://swtch.com/plan9port/unix"
license=('MIT')
source=(http://swtch.com/plan9port/unix/mk-with-libs.tgz
        destdir.patch)
md5sums=('fdc0717b82f1a62cfaf9cf3155a7df00'
         '9b50c0dd01a791729de2493eab8809a4')

build() {
  cd "$srcdir/$pkgname"

  patch -Np1 -i "${srcdir}/destdir.patch" || return 1

  make || return 1
  make PREFIX="/usr" DESTDIR="$pkgdir/" install

  # /usr/share/man/man3/bio.3.gz is owned by openssl
  rm $pkgdir/usr/share/man/man3/bio.3
}
