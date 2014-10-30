# Maintainer: Kevin <aur[at]kevin[dot]wellsie[dot]net>
pkgname=xdg-gmail-git
pkgver=1.0
pkgrel=1
pkgdesc="xdg-email will open mailto: links in chromium"
url="https://github.com/mbr/xdg-gmail"
arch=('any')
license=('MIT')
depends=('desktop-file-utils' 'python')
optdepends=()
makedepends=('git')
conflicts=()
replaces=()
backup=()
install='xdg-gmail-git.install'
source=("git+https://github.com/mbr/xdg-gmail.git")
md5sums=('SKIP')

package() {
	cd xdg-gmail
	install -Dm755 xdg-gmail.py "$pkgdir/usr/bin/xdg-gmail.py"
	install -Dm644 xdg-gmail.desktop "$pkgdir/usr/share/applications/xdg-gmail.desktop"
}

# vim:set ts=2 sw=2 et:
