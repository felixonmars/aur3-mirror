# Maintainer: M0Rf30

pkgname=simple-scan-devel
pkgver=3.2.0
pkgrel=1
pkgdesc='Simple scanning utility'
arch=('i686' 'x86_64')
url='http://launchpad.net/simple-scan'
license=('GPL3')
depends=('sane' 'gconf')
makedepends=('gnome-doc-utils' 'intltool')
install="${pkgname}.install"
source=("http://ftp.gnome.org/pub/GNOME/sources/${pkgname:0:11}/${pkgver:0:3}/${pkgname:0:11}-${pkgver}.tar.bz2")

build() {
  cd ${pkgname:0:11}-${pkgver}

  ./configure --prefix=/usr 
  make
}

package() {
  cd ${pkgname:0:11}-${pkgver}

  make DESTDIR=${pkgdir} install
}

md5sums=('c59bf65e331d9d6017ab16ca13490397')
