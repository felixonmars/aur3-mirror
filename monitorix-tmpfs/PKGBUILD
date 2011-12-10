# Contributor: graysky <graysky AT archlinux dot us>
pkgname=monitorix-tmpfs
pkgver=1.1
pkgrel=2
pkgdesc='Simple script to allow monitorix to run in tmpfs sync data back to your hdd.'
arch=(any)
license=(GPL)
depends=('rsync' 'monitorix>=1.4.1-6')
_exe="sync-monitorix"
source=($_exe)
url="https://aur.archlinux.org/packages.php?ID=34134"
install=$pkgname.install

package() {
	install -Dm755 $_exe "$pkgdir"/usr/bin/$_exe
	mkdir -p "$pkgdir"/etc/cron.hourly
	ln -sf /usr/bin/$_exe "$pkgdir"/etc/cron.hourly/$_exe
}
sha256sums=('e096c9103cbcd21ed92568e64909f5b281d3a25ac4e0699000be46a6ecdf8eef')
