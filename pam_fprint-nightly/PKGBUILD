# Maintainer: Roberto Vanto <r.vanto@gmail.com>

pkgname=pam_fprint-nightly
pkgver=20080330
_pkgrev=5452ea09
pkgrel=1
pkgdesc="pam module for fingerprint authentication"
arch=('i686' 'x86_64')
url="http://reactivated.net/fprint/wiki/Main_Page"
groups=('fprint')
license=('LGPL')
depends=('libfprint-nightly' 'pam')
source=(http://projects.reactivated.net/snapshots/pam_fprint/pam_fprint-$pkgver-$_pkgrev.tar.bz2)
md5sums=('da4b04257e820e631c55675a623c25c0')
build() {
  cd $startdir/src/pam_fprint-$pkgver-$_pkgrev
  ./autogen.sh --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
