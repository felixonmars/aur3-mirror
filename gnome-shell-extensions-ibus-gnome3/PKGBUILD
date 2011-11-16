# Maintainer : dongfengweixiao <adaptee [at] gmail [dot] com>

pkgname=gnome-shell-extensions-ibus-gnome3
pkgver=3.2.1.20111104
pkgrel=1
pkgdesc="GNOME-Shell GJS Plugin for IBus"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://ibus.googlecode.com"
depends=( 'ibus' 'gnome-shell' 'gjs' )
makedepends=('intltool')
source=('ibus-gjs-3.2.1.20111104.tar.gz')
md5sums=('d49a93c05a69bcdd65a839381d9fbaa1')
conflicts=('ibus-gjs-git')
build() {
  cd ${srcdir}/ibus-gjs-3.2.1.20111104
  ./autogen.sh 
  ./configure --prefix=/usr 
  make 
}

package() {
  cd ${srcdir}/ibus-gjs-3.2.1.20111104
  make DESTDIR=${pkgdir} install 
}
