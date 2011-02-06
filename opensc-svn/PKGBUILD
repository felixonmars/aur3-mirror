# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Eduard Warkentin <eduard.warkentin@gmail.com>
# Contributor: neuromante <lorenzo.nizzi.grifi@gmail.com>
# Contributor: Eduardo Robles Elvira <edulix@gmail.com>

pkgname=opensc-svn
pkgver=4619
pkgrel=1
pkgdesc="Access smart cards that support cryptographic operations"
arch=('i686' 'x86_64')
url="http://www.opensc-project.org/opensc"
license=("LGPL")
options=('!libtool')
backup=(etc/opensc.conf)
depends=('zlib' 'openssl' 'pcsclite')
makedepends=('autoconf' 'automake' 'nasm' 'subversion')
provides=('opensc')
conflicts=('opensc')
source=()
md5sums=()

_svntrunk=http://www.opensc-project.org/svn/opensc/trunk/
_svnmod=opensc


build() {
  cd $startdir/src

  msg "Updating SVN entries for $_svnmod..."
  svn co $_svntrunk $_svnmod -r $pkgver
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  ./bootstrap
  ./configure --prefix=/usr --sysconfdir=/etc --enable-pcsc --disable-man
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
  install -Dm644 ${srcdir}/$_svnmod-build/etc/opensc.conf ${pkgdir}/etc/opensc.conf || return 1
  mkdir -p ${pkgdir}/usr/include/libopensc || return 1
  install -Dm644 ${srcdir}/$_svnmod-build/src/libopensc/*.h ${pkgdir}/usr/include/libopensc || return 1
  mkdir -p ${pkgdir}/usr/include/scconf || return 1
  install -Dm644 ${srcdir}/$_svnmod-build/src/scconf/*.h ${pkgdir}/usr/include/scconf || return 1
  mkdir -p ${pkgdir}/usr/include/common || return 1
  install -Dm644 ${srcdir}/$_svnmod-build/src/common/*.h ${pkgdir}/usr/include/common || return 1
}
