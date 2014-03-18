# Maintainer: Alfred Krohmer <devkid@devkid.net>
pkgname=nftables-systemd-git
pkgver=r19.f989a7b
pkgrel=1
pkgdesc="Control script for nftables with a systemd service file"
arch=('any')
url="https://github.com/devkid/nftables-systemd"
license=('GPL')
depends=('nftables')
makedepends=('git')
source=('nftables-systemd'::'git+https://github.com/devkid/nftables-systemd.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/nftables-systemd"
	printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/nftables-systemd"
	install -Dm755 "nftablesctl" "$pkgdir/usr/bin/nftablesctl"
	install -Dm644 "nftables.service" "$pkgdir/usr/lib/systemd/system/nftables.service"
}
