# $Id: PKGBUILD 58243 2009-11-06 14:30:49Z eric $
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=slang-baudrate-fixed
_pkgname=slang
pkgver=2.2.3
pkgrel=1
pkgdesc="S-Lang is a powerful interpreted language (with fix for baudrate grater than 230400)"
arch=('i686' 'x86_64')
url="http://www.s-lang.org/"
license=('GPL')
depends=('glibc' 'pcre' 'zlib')
backup=('etc/slsh.rc')
provides=('slang')
conflicts=('slang')
options=('!makeflags')
source=(
"ftp://ftp.fu-berlin.de/pub/unix/misc/slang/v${pkgver%.*}/${_pkgname}-${pkgver}.tar.gz"
"fix.patch")
md5sums=('ffd7718a9808894413a0e0ee82a79335'
         'a1b9753d55769216a68547b51bef8bf4')
sha1sums=('e7ea285433b78473911dc2dd8429764501369837'
          '60ed14e99abf3e041dee18d3b04c4315dc867a1b')


build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -p1 -i ${srcdir}/fix.patch || return 1
  ./configure --prefix=/usr --sysconfdir=/etc || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install-all || return 1
}

