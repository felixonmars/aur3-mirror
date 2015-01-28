## Maintainer: pyamsoft <pyam.soft@gmail.com>

pkgname=steam-wrapper
pkgdesc="Steam wrapper for common operations"
pkgver=0.1.2
pkgrel=1
arch=('i686' 'x86_64')
optdepends=('steam-native: Native runtime library support')
depends=('steam' 'bash' 'coreutils')
provides=("${pkgname}")
license=('custom')
source=("${pkgname}" "${pkgname}.desktop")
url="https://github.com/pyamsoft/steam-wrapper.git"

pkgver() {
	cd "$srcdir"

	# Source the version from the script because too lazy to update two different files.
	echo "$(head -n 4 ${pkgname} | tail -n 1 | cut -c9-)"
}

package() {
	cd "$srcdir"

	# Install the script
	mkdir -p "$pkgdir"/usr/bin/
	cp "${pkgname}" "$pkgdir"/usr/bin/
	chmod 755 "$pkgdir"/usr/bin/${pkgname}

	# Install the desktop file
	mkdir -p "$pkgdir"/usr/share/applications/
	cp ${pkgname}.desktop "$pkgdir"/usr/share/applications/
	chmod 644 "$pkgdir"/usr/share/applications/${pkgname}.desktop
}

sha256sums=('a785e525a1c3fbb4ee590a7d0b67df5352ebf32dd7727aa1021db0d03eddf3f9'
            '38e5eeb6011dbfb0bab424a8ce27b456f44ccff0c295aa03daac9b542fd69754')
