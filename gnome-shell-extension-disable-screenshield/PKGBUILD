# Contributor: Ron Simart

pkgname=gnome-shell-extension-disable-screenshield
pkgver=72c72d96f3
pkgrel=3
pkgdesc="Disable screen shield when screen lock is disabled."
arch=('any')
url="https://github.com/lgpasquale/gnome-shell-extension-disable-screenshield"
license=('unknown')
depends=('gnome-shell')
makedepends=('git')

source=(
	'git+https://github.com/lgpasquale/gnome-shell-extension-disable-screenshield.git'
	'gnome-shell-3.14.diff'
	'gnome-shell-3.16.diff'
)
md5sums=(
	'SKIP'
	'53a713c18ecc074a863a10bb0d656879'
	'4096322620d62b4c0b22bbd2b0bc909f'
)

prepare() {
	cd "$srcdir"
	patch -p0 < gnome-shell-3.14.diff
	patch -p0 < gnome-shell-3.16.diff
}

package() {
	cd "$srcdir/$pkgname"
#	cd "$srcdir/gnome-shell-extension-disable-screenshield"
	mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/disable-screenshield@lgpasquale.com"
	cp extension.js metadata.json "$pkgdir/usr/share/gnome-shell/extensions/disable-screenshield@lgpasquale.com/"
}
