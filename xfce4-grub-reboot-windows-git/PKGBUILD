# Submitter: Alex Chamberlain <alex@alexchamberlain.co.uk>
# Maintainer: Alex Chamberlain <alex@alexchamberlain.co.uk>

pkgname=xfce4-grub-reboot-windows-git
_gitname=xfce4-grub-reboot-windows
pkgver=d08c26f
pkgrel=1
pkgdesc="Reboot into Windows"
url="http://github.com/alexchamberlain/xfce4-grub-reboot-windows"
arch=('any')
license=('MIT')
depends=('xfce4-session' 'grub')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=('git+https://github.com/alexchamberlain/xfce4-grub-reboot-windows')
md5sums=(SKIP)

pkgver() {
    cd "$_gitname"
    git rev-parse --short HEAD
}

package() {
	cd "$_gitname"
	install -D xfce4-grub-reboot-windows "$pkgdir/usr/bin/xfce4-grub-reboot-windows"
	install -Dm644 "xfce4-grub-reboot-windows.desktop" "$pkgdir/usr/share/applications/xfce4-grub-reboot-windows.desktop"
	install -Dm644 "windows.svg" "$pkgdir/usr/share/icons/windows.svg"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}