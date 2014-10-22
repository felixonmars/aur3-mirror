# Maintainer: Philip Abernethy<chais.z3r0@gmail.com>
pkgname=gnome-shell-theme-yosemite-shell-git
_gitname="Yosemite-Shell"
pkgver=r9.55033e8
pkgrel=1
pkgdesc="OSX like GNOME Shell Theme"
url="https://github.com/nicksniffer/${_gitname}"
arch=('any')
license=('GPLv3')
depends=('gnome-shell')

source=("git+https://github.com/nicksniffer/${_gitname}")
sha512sums=('SKIP')

pkgver() {
	cd "${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}"
	find . -type d -exec install -dm755 "${pkgdir}"/usr/share/themes/{} \;
	find . -type f -exec install -m644 {} "${pkgdir}"/usr/share/themes/{} \;
}
