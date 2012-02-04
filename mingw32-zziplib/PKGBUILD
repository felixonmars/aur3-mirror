# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: Adam Griffiths

pkgname=mingw32-zziplib
pkgver=0.13.58
pkgrel=2
pkgdesc="A lightweight library that offers the ability to easily extract data from files archived in a single zip file (mingw32)"
arch=('i686' 'x86_64')
url="http://zziplib.sourceforge.net"
license=("LGPL" "MPL")
depends=('mingw32-zlib' 'mingw32-gcc')
makedepends=('python')
source=(http://downloads.sourceforge.net/zziplib/zziplib-${pkgver}.tar.bz2)
md5sums=('a0f743a5a42ca245b2003ecaea958487')
options=('!strip' '!libtool')

build() {
  cd ${srcdir}/zziplib-${pkgver}

  unset LDFLAGS
  ./configure --prefix=/usr/i486-mingw32 --host=i486-mingw32
  make
  make DESTDIR=${pkgdir} install

  #fix permission
  chmod -s ${pkgdir}/usr/i486-mingw32/share/man/man3
  chmod 644 ${pkgdir}/usr/i486-mingw32/share/man/man3/*
  chown -R root:root ${pkgdir}/usr/i486-mingw32/share/man/man3
}
