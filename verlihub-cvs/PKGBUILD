# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=verlihub-cvs
pkgver=20100409
pkgrel=1
pkgdesc="VerliHub is a Direct Connect protocol server (Hub)"
arch=('i686')
url="http://verlihub.sourceforge.net/"
license=('GPL')
depends=('geoip' 'mysql' 'pcre')
provides=('verlihub')
conflicts=('verlihub')
makedepends=('cvs' 'patch')
options=('!libtool')
source=(verlihub-glibc-2.8.patch)
md5sums=('83a28fc8ecb551f20c4f51e083a085de')

_cvsmod="verlihub"
_cvsroot=":pserver:anonymous@verlihub.cvs.sf.net:/cvsroot/verlihub"

build() {
  cd ${srcdir}

  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs -z3 update -d
  else
    cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
    cd $_cvsmod
  fi
  msg "CVS checkout done or server timeout"

  rm -rf ${srcdir}/$_cvsmod-build || return 1
  cp -r ${srcdir}/$_cvsmod ${srcdir}/$_cvsmod-build || return 1
  cd ${srcdir}/$_cvsmod-build || return 1

  msg "Starting make..."
  patch -Np1 -i ${srcdir}/verlihub-glibc-2.8.patch || return 1

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${pkgdir} install
}
