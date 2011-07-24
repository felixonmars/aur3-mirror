# $Id: PKGBUILD 87317 2010-08-12 11:57:33Z tpowa $
# Maintainer: alphazo <alphazo@gmail.com>
# Based upon on ABS package from damir <damir@archlinux.org>

pkgname=libksba-latest
pkgver=1.2.0
pkgrel=1
pkgdesc="Libksba is a CMS and X.509 access library. Interim version until 1.2 hits Extra. Required for compiling GnuPG 2.1"
arch=(i686 x86_64)
license=('GPL')
url="ftp://ftp.gnupg.org/gcrypt/libksba"
depends=('bash' 'libgpg-error' 'glibc')
source=(ftp://ftp.gnupg.org/gcrypt/libksba/libksba-$pkgver.tar.bz2)
options=(!libtool)
provides=('libksba')
replaces=('libksba')
conflicts=('libksba')

build() {
  cd $startdir/src/libksba-$pkgver
  ./configure --prefix=/usr
  make
  make DESTDIR=$startdir/pkg install
}
md5sums=('e797f370b69b4dc776499d6a071ae137')
