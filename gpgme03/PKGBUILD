# $Id: PKGBUILD,v 1.5 2006/05/22 18:57:55 uid1014 Exp $
# Maintainer: tobias <tobias@archlinux.org>

pkgname=gpgme03
pkgver=0.3.16
pkgrel=3
pkgdesc="A C wrapper library for GnuPG (0.3.X version)"
arch=(i686 x86_64)
depends=('gnupg')
license=('GPL')
source=(ftp://ftp.gnupg.org/gcrypt/gpgme/gpgme-$pkgver.tar.gz)
md5sums=('0476b219695ea25cb2a97b18b717e381')
url="http://www.gnupg.org/related_software/gpgme/"

build() {
  cd $startdir/src/gpgme-$pkgver
  ./configure --prefix=/usr \
    --libdir=/usr/lib/gpgme03 \
    --includedir=/usr/include/gpgme03
  make || return 1
  make DESTDIR=$startdir/pkg install
  mv $startdir/pkg/usr/bin/gpgme-config $startdir/pkg/usr/bin/gpgme-config03
  rm -rf $startdir/pkg/usr/share
  find $startdir/pkg -name '*.la' -exec rm {} \;
}
# vim: ft=sh ts=2 et
