# Maintainer: Evan Penner <evaninrussia@gmail>

pkgname=tpfand
pkgver=0.94
pkgrel=8
pkgdesc="Monitors temperatures and controls fan speed of IBM/Lenovo ThinkPad notebooks."
arch=('any')
url="http://www.gambitchess.org/mediawiki/index.php/ThinkPad_Fan_Control"
license=('GPL3')
depends=(python2 hal dbus-python pygobject)
optdepends=(tpfan-admin tpfand-profiles)
source=(http://launchpad.net/tp-fan/tpfand/$pkgver/+download/tpfand-$pkgver.tar.gz tpfand.DAEMON tpfand.PMUTILS)

package() {
	cd "$srcdir/$pkgname-$pkgver"

	sed -i 's|#! /usr/bin/env python|#! /usr/bin/env python2|' src/tpfand/* wrappers/tpfand

	install -d $pkgdir/usr/lib/python2.7/site-packages/tpfand
	install -m644 src/tpfand/* $pkgdir/usr/lib/python2.7/site-packages/tpfand
	install -d $pkgdir/usr/share/tpfand/models/{by-id,by-name}
	install -m644 share/models/generic $pkgdir/usr/share/tpfand/models
	install -d $pkgdir/etc/dbus-1/system.d/
	install -m644 etc/dbus-1/system.d/* $pkgdir/etc/dbus-1/system.d/
	install -d $pkgdir/usr/bin
	install wrappers/tpfand $pkgdir/usr/bin/
	install -d $pkgdir/etc/modprobe.d
	install -m644 etc/modprobe.d/thinkpad_acpi.modprobe $pkgdir/etc/modprobe.d/thinkpad_acpi.conf
	if [ -e /etc/tpfand.conf ] 
	then install -m644 /etc/tpfand.conf $pkgdir/etc/tpfand.conf 
	else install -m644 etc/tpfand.conf $pkgdir/etc/tpfand.conf
	fi
	install -D -m755 $srcdir/tpfand.DAEMON $pkgdir/etc/rc.d/tpfand
	install -D -m755 $srcdir/tpfand.PMUTILS $pkgdir/etc/pm/sleep.d/09tpfand
}

md5sums=('fa08a5c3eebd47842e1fb84b6283416d'
         'c6dfc84ea0ccff47ef8dfc02dc8898d8'
         'aa05644ace593d595598666d1513f472')
