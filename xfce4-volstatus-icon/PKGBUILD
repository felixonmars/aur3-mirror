# $Id: PKGBUILD 17155 2010-05-20 00:56:13Z allan $
# Contributor: Allan McRae <mcrae_allan@hotmail.com>
# Contributor: Andrew Simmons <andrew.simmons@gmail.com>

pkgname=xfce4-volstatus-icon
pkgver=0.1.0
pkgrel=4
pkgdesc="A system tray icon that allows you to easily unmount removable volumes."
arch=('i686' 'x86_64')
url="http://goodies.xfce.org/projects/applications/xfce4-volstatus-icon"
license=('GPL')
depends=('exo' 'libxfcegui4' 'hal')
makedepends=('xfce4-dev-tools')
source=(http://git.xfce.org/apps/xfce4-volstatus-icon/snapshot/xfce4-volstatus-icon-0.1.0.tar.bz2)
md5sums=('d0c4fbb93bdefe3462675e8c4501fdc5')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./autogen.sh
  ./configure --disable-static --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}

