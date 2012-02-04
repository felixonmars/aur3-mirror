pkgname=gcvs
pkgver=1.0
pkgrel=1
pkgdesc="The CvsGui project is providing several high-end interface clients (WinCvs, MacCvs, gCvs) written in C++ using popular frameworks (MFC, PowerPlant, GTK+) with a scripting support via Python or TCL. "
arch=('i686' 'x86_64')
url="http://www.wincvs.org"
license=('GPL2')
depends=('gtk' 'tcl' 'cvs' 'libdes')
source=('http://sourceforge.net/projects/cvsgui/files/gCvs/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.bz2/download' 'gcvs.gcc4.patch')
md5sums=('063b5805eda434f47251af9278168adb' '6ee98e803b864e31a63863af863e6991')
	
build() {
  cd ${srcdir}/
  patch -p0 < gcvs.gcc4.patch
  cd ${pkgname}-${pkgver}
  unset CFLAGS
  unset CXXFLAGS
  unset LDFLAGS
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}

