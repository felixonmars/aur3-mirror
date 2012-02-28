# $Id: PKGBUILD 57021 2011-10-18 18:14:16Z bpiotrowski $
# Maintainer: Mateusz Herych <heniekk@gmail.com>
# Contributor: Charles Lindsay <charles@chaoslizard.org>

pkgname=cdemu-daemon-fixed
_pkgname=cdemu-daemon
pkgver=1.5.0
pkgrel=2
pkgdesc="CD/DVD-ROM device emulator daemon with a few lil PKGBUILD fixes"
arch=('i686' 'x86_64')
backup=('etc/conf.d/cdemud'
	'etc/dbus-1/system.d/cdemud-dbus.conf')
url="http://cdemu.sourceforge.net/"
license=('GPL')
depends=('glib2' 'dbus' 'dbus-glib' 'libpulse' 'vhba-module' "libmirage-fixed" 'libao')
install=cdemud.install
source=(http://downloads.sourceforge.net/cdemu/$_pkgname-$pkgver.tar.bz2
        cdemud.conf
        cdemud.rc
        60-vhba.rules)
md5sums=('5ba780caa26d855942512b5b3c22405a'
         '1f512c2c7a61d021514ce58dac2bce25'
         '340a30ab2c42162b3bd042c74a399219'
         '549bd2d9696bd1884c8eed7193c00e21')
provides=('cdemu-daemon')
replaces=('cdemu-daemon')
conflicts=('cdemu-daemon')

build() {
  cd $srcdir/$_pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  make DESTDIR=$pkgdir install
  install -m 644 -D ../cdemud.conf $pkgdir/etc/conf.d/cdemud
  install -m 755 -D ../cdemud.rc $pkgdir/etc/rc.d/cdemud

  # Install udev rule for non-root mounting of iso's 
  install -D -m 755 "${srcdir}/60-vhba.rules"  "$pkgdir/lib/udev/rules.d/60-vhba.rules"

}
