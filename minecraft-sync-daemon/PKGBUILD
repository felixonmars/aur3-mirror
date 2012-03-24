# Maintainer: pirateofms <chop AT dreadpiratechop DOT com>
# Feel free to email bug reports, but honestly, this was a bit of a hack-job project, and as
# long as it works, I probably won't mess with it.  If you get the urge to fix or improve something,
# however, email me and I'll update the script.  I'm sure it needs it.

pkgname='minecraft-sync-daemon'
_pkgname_short='msd'
pkgver=1.0
pkgrel=1
pkgdesc='Symlinks and syncs minecraft world dirs to RAM thus reducing HDD/SDD calls and speeding-up the server.'
arch=('any')
url=('http://www.dreadpiratechop.com/msd/')
license=('GPL')
depends=('rsync')
optdepends=('cron: allow hourly (default) or periodic syncs of tmpfs <--> HDD/SDD storage')
conflicts=('')
replaces=('')
source=("http://www.dreadpiratechop.com/msd/$pkgname-$pkgver.tar.xz")
backup=("etc/$_pkgname_short.conf")
install=readme.install
sha256sums=('54a7cab34a4ebe88be6cfedec5b7ea4006ea2b3e115c9ce4a4bc9d6439dd5d12')

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm644 $_pkgname_short.conf "$pkgdir/etc/$_pkgname_short.conf"
	install -Dm755 rc.$_pkgname_short "$pkgdir/etc/rc.d/$_pkgname_short"
	install -Dm755 $_pkgname_short.cron.hourly "$pkgdir/etc/cron.hourly/$_pkgname_short-update"
	install -Dm644 "$_pkgname_short.service" "$pkgdir/lib/systemd/system/$_pkgname_short.service"
	
}
