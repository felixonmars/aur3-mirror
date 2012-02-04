# $Id: PKGBUILD 100055 2010-11-20 03:29:05Z stephane $
# Maintainer: dorphell <dorphell@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=gawk3
_pkgname=gawk
pkgver=3.1.8
pkgrel=2
pkgdesc="Gnu version of awk. Version 3.1.8. Binary and manpage only."
arch=(i686 x86_64)
url="http://www.gnu.org/directory/GNU/gawk.html"
license=('GPL')
groups=('base')
provides=('awk')
install=gawk.install
source=(ftp://ftp.gnu.org/pub/gnu/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
depends=('sh' 'glibc')
md5sums=('35937a0f83f0efe7a8c2dee635624784')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make 
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  install -Dm755 gawk "$pkgdir/usr/bin/gawk3"
  install -Dm644 doc/gawk.1 "$pkgdir/usr/share/man/man1/gawk3.1"
}

