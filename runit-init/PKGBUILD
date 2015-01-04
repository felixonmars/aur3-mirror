# Contributor: Neale Pickett <neale@woozle.org>

pkgname=runit-init
pkgver=4.1
pkgrel=1
pkgdesc="Replaces init with busybox's runit"
arch=("i686" "x86_64")
url="http://woozle.org/neale/g.cgi/aur/runit-init"
license=(BSD)
depends=(busybox util-linux)
provides=(runit)
conflicts=(systemd-sysvcompat runit)
backup=(etc/mdev.conf)
source=('git+http://woozle.org/neale/g.cgi/aur/runit-init')
md5sums=(SKIP)

package () {
	echo $srcdir/$pkgname
	cd $srcdir/$pkgname
	./INSTALL $pkgdir
}
