# Contributor: graysky <graysky AT archlinux dot us>

pkgname=monitorix-sync-daemon
pkgver=2.1
pkgrel=2
pkgdesc='Symlinks and syncs monitorix databases to RAM thus reducing HDD/SDD calls and speeding-up monitorix.'
arch=(any)
url="https://wiki.archlinux.org/index.php/Monitorix-sync-daemon"
license=(GPL)
depends=('rsync' 'monitorix>=2.0')
optdepends=('cron: allow hourly (default) or periodic syncs of tmpfs <--> HDD/SDD storage')
conflicts="monitorix-tmpfs"
replaces="monitorix-tmpfs"
source="https://github.com/graysky2/monitorix-sync-daemon/raw/master/msd-source.tar.xz"
sha256sums=('c0cc0f33c08f3621469668d2272264e1c89ade3ffd52141a5f0dc5d7137bef9d')
install=readme.install

package() {
	cd "$srcdir/msd-source"
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm755 rc.msd "$pkgdir/etc/rc.d/msd"
	install -Dm755 msd.cron.hourly "$pkgdir/etc/cron.hourly/msd-update"
}
