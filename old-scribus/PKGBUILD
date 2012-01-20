# $Id$
# Maintainer: orux

pkgname=old-scribus
pkgver=1.2.5
pkgrel=3
pkgdesc="A desktop publishing program"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.scribus.net"
install=${pkgname}.install
depends=('libcups>=1.2.10' 'lcms>=1.16' 'qt3>=3.3.8' 'ghostscript>=8.15.4' \
         'libart-lgpl>=2.3.19' 'python>=2.5' 'libxml2>=2.6.27' 'cairo' \
			'desktop-file-utils')
makedepends=('')
options=('')
source=('http://surfnet.dl.sourceforge.net/sourceforge/scribus/scribus-1.2.5.tar.bz2' 'scribus.svg' 'old-scribus.desktop' 'old-scribus-python.patch' 'old-scribus.install')
md5sums=('e005b1d616b8668bb23f0a130465385a' 'ab63e2607f9cbdccd1f89cd2561fc4e3' '816f9f25169a6c87d66b38e933571c9e' '8767cf4fdc1a0d0598bf7bfe45adfa67' '2889113b089fdb01bfd73370ab082926')

build() {
  # Source the QT profile
  source /etc/profile.d/qt3.sh

  patch ${startdir}/src/scribus-1.2.5/acinclude.m4 < old-scribus-python.patch

  cd ${startdir}/src/scribus-1.2.5

  ./configure --program-prefix=old- --prefix=/opt/scribus-1.2.5
  make || return 1
  make DESTDIR=$startdir/pkg install

  install -d ${startdir}/pkg/usr/bin
  ln -sf /opt/scribus-1.2.5/bin/old-scribus ${startdir}/pkg/usr/bin/old-scribus

  install -Dm644 $startdir/scribus.svg ${startdir}/pkg/usr/share/pixmaps/scribus.svg

  install -Dm644 $startdir/old-scribus.desktop ${startdir}/pkg/usr/share/applications/old-scribus.desktop
}
