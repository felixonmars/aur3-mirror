# $Id: PKGBUILD 9945 2008-08-21 02:21:01Z eric $
# Maintainer: kevin <kevin@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: muflax <muflax@gmail.com>

pkgname=sash
pkgver=3.7
pkgrel=5
pkgdesc="Stand-alone shell with many commands but does not require glibc"
arch=(i686 x86_64)
license=('custom')
install=${pkgname}.install
source=(http://www.canb.auug.org.au/~dbell/programs/${pkgname}-${pkgver}.tar.gz
sash-3.7-add-fs-include.patch)
url="http://www.canb.auug.org.au/~dbell/"
md5sums=('ee7c7ed5aad76599974d016a6f201ef4'
         '204582446e244fd6edaa80391c507f83')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np1 -i ../sash-3.7-add-fs-include.patch
  /usr/bin/make || return 1
  /bin/mkdir -p ${startdir}/pkg/bin ${startdir}/pkg/usr/share/man/man1
  /usr/bin/make BINDIR=${startdir}/pkg/bin MANDIR=${startdir}/pkg/usr/share/man/man1 install || return 1

  # Only license mentioned is in the *.c files.
  install -d ${startdir}/pkg/usr/share/licenses/${pkgname}
  sed -n '1,\%^ \*/$% p' sash.c \
      >${startdir}/pkg/usr/share/licenses/${pkgname}/license.txt
}
# vim: ts=2 sw=2 et ft=sh
