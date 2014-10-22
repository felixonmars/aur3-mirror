# Maintainer: GreenRaccoon23 <GreenRaccoon a t gmail d o t com>

_pkgname=gnomintu
pkgname=gnomintu-icon-theme
pkgver=5.0.r14.cd2c1e6
pkgrel=40
pkgdesc='Fusion of Mint-X, GNOME, Ubuntu-Mono, and Humanity icon themes.'
arch=('any')
url="https://github.com/GreenRaccoon23/gnomintu"
license=('GPL3')
makedepends=('git' 'intltool' 'librsvg' 'gtk-update-icon-cache')
install="$_pkgname.install"
source=("$pkgname"::"git+https://github.com/GreenRaccoon23/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "5.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$pkgname"
  	install -dm 755 "$pkgdir"/usr/share/icons/gnomintu
  	cp -drf --no-preserve='ownership' . "$pkgdir"/usr/share/icons/gnomintu/

}