_name=retroarch-joypad-autoconfig
pkgdesc='Autoconfiguration files for RetroArch.'
license=('GPL3')

url="https://github.com/libretro/${_name}"
source=("git://github.com/libretro/${_name}.git")
pkgname=${_name}-git
pkgver=103.1de8df7
pkgrel=1
arch=('any')
makedepends=('git')
provides=("${_name}")
conflicts=("${_name}")
md5sums=('SKIP')

pkgver() {
	cd "${_name}"
	echo "$(git rev-list --count HEAD).$(git describe --always)"
}

package() {
	cd "${_name}"
	install -dm755 "${pkgdir}/usr/share/libretro/autoconfig"
	cp -r udev "${pkgdir}/usr/share/libretro/autoconfig/"
	cp -r parport "${pkgdir}/usr/share/libretro/autoconfig/"
}
