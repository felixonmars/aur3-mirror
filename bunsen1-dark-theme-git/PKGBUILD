# Maintainer: Steef435 <steefhegeman at hotmail dot com>

pkgname=bunsen1-dark-theme-git
pkgver=r6.5f8f610
pkgrel=1
pkgdesc="A dark theme for Bunsen. git version"
arch=('any')
url="https://github.com/BunsenLabs/bunsen1-dark-theme"
license=('GPL' 'CCPL:by-sa-3.0')
optdepends=('gtk3: required for CSS/GTK3 theme'
	'gtk-engine-murrine: required for GTK2 theme'
	'lib32-gtk-engine-murrine: required for multilib (GTK2)')
source=('git+https://github.com/BunsenLabs/bunsen1-dark-theme.git')
sha1sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	( set -o pipefail
	git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {
	cd "bunsen1-dark-theme"

	install -dm 755 "$pkgdir"/usr/share/themes/Bunsen1-dark
	rm -rf .git debian LICENSE.CC LICENSE.GPL README
	cp -dr --no-preserve='ownership' * "$pkgdir"/usr/share/themes/Bunsen1-dark/
}
