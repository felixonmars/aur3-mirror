# Maintainer: Guten Ye

pkgname=saber
pkgver=1.1.0
pkgrel=3
pkgdesc="A complete solution for PT users."
arch=("any")
url="http://github.com/GutenYe/saber"
license=("MIT")
depends=("ruby" "openssh" "rsync")
optdepends=("aria2: a download utility."
	"yaaw-git: an aria2 web interface."
	"rutorrent-saber-git: rutorrent saber plugin.")
install=install
source=( "https://github.com/SaberSalv/saber/raw/master/systemd/saber-client@.service"
	"https://github.com/SaberSalv/saber/raw/master/systemd/saber-server@.service"
	"https://github.com/SaberSalv/saber/raw/master/systemd/saber-chd@.service")

package() {
	cd "$srcdir"

	install -Dm644 saber-server@.service "$pkgdir/usr/lib/systemd/system/saber-server@.service"
	install -Dm644 saber-client@.service "$pkgdir/usr/lib/systemd/system/saber-client@.service"
	install -Dm644 saber-chd@.service "$pkgdir/usr/lib/systemd/system/saber-chd@.service"
}

md5sums=('66736719484cd38690c78ad26208469b'
         'cc7eb45e6c162adcd4755797d7db0498'
         '5f63fc66bc1929d768c3e0d433fc0c0c')
