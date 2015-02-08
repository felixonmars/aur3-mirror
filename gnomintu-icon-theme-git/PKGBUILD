# Maintainer: GreenRaccoon23 <GreenRaccoon a t gmail d o t com>

pkgname=gnomintu-icon-theme-git
pkgver=r81.ee90ee7
pkgrel=1
pkgdesc='Fusion of Mint-X, Ubuntu-Mono, Humanity, and GNOME icon themes (mostly Mint-X and Ubuntu-Mono).'
arch=('any')
url="https://github.com/GreenRaccoon23/${pkgname%-*}"
license=('GPL3')
makedepends=('git' 'intltool' 'librsvg' 'gtk-update-icon-cache')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
options=('!strip')
install="${pkgname%-*}.install"
source=("git+https://github.com/GreenRaccoon23/${pkgname%-*}.git")
md5sums=('SKIP')

pkgver() {
	cd ${pkgname%-*}
	(	set -o pipefail
		git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g' || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
	#printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
	cd ${pkgname%-*}
  	install -dm 755 "$pkgdir"/usr/share/icons
  	cp -drf --no-preserve='ownership' . "$pkgdir"/usr/share/icons/
}

