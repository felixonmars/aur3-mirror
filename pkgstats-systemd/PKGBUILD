# $Id: PKGBUILD 164330 2012-07-30 15:42:06Z pierre $
# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=pkgstats-systemd
pkgver=2.3
pkgrel=2
pkgdesc='Submits a list of installed packages to the Arch Linux project - With Optional Systemd Support'
arch=('any')
url='https://www.archlinux.de'
license=('GPL')
depends=('bash' 'curl' 'pacman' 'sed' 'coreutils' 'awk' 'grep')
optdepends=('systemd: For systemd.timer support'
	    'cron: For classic crontab support')
conflicts=('pkgstats')
provides=('pkgstats')
source=('pkgstats.sh' 'pkgstats.cron' 'pkgstats.service' 'pkgstats.timer')
install=pkgstats.install

package() {
	install -Dm644 $srcdir/pkgstats.service $pkgdir/usr/lib/systemd/system/pkgstats.service
	install -Dm644 $srcdir/pkgstats.timer $pkgdir/usr/lib/systemd/system/pkgstats.timer
	install -D -m755 ${srcdir}/pkgstats.sh ${pkgdir}/usr/bin/pkgstats
	install -D -m744 ${srcdir}/pkgstats.cron ${pkgdir}/etc/cron.weekly/pkgstats
	install -d "$pkgdir/usr/lib/systemd/system/multi-user.target.wants"
	cd $pkgdir/usr/lib/systemd/system/multi-user.target.wants
	ln -s ../pkgstats.timer ./
}
md5sums=('2943bc8c69999d8e3c0bd9b368a3f17b'
         'e86e6b9778303367f2e31f5c311da685'
         'f342da4524f587c09f26ab8047e949ed'
         '50ff5246fa125455d8f2c933c5b5220b')
