# $Id: PKGBUILD 20945 2010-07-12 20:22:41Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: SmackleFunky <smacklefunky@optusnet.com.au>

pkgname=synce-odccm
pkgver=0.13
pkgrel=7
pkgdesc="provide a means of communication with a Windows CE device - daemon to communicate with a handheld device"
arch=('i686' 'x86_64')
url="http://synce.sourceforge.net/"
license=('GPL')
depends=('synce-libsynce' 'gnet' 'synce-hal')
backup=(etc/dbus/system.d/odccm.conf)
source=(http://downloads.sourceforge.net/synce/odccm-$pkgver.tar.gz
	synce-odccm.rc
	dbus-error-fix.patch)
md5sums=('8f12585398f1a79518887d5f94cf122d'
         '5759fb86bb2af46d632c3807616c8999'
         '4eea398fe356fe0d8c57d65d6f24b3db')

package() {
  cd $srcdir/odccm-$pkgver
  patch -p1 < $srcdir/dbus-error-fix.patch
  echo "Patched and going for configure"
  ./configure --prefix=/usr
  echo "Going for make"
  make
  make DESTDIR=$pkgdir install
  echo "going for install"
  install -D -m 644 $srcdir/odccm-$pkgver/src/odccm.conf $pkgdir/etc/dbus-1/system.d/odccm.conf
  install -D -m 755 $srcdir/synce-odccm.rc $pkgdir/etc/rc.d/synce-odccm
}
