pkgname=gtk-theme-orion-git
pkgver=1.4.2git20140326.8285894
pkgrel=1
pkgdesc='Modern light theme. It supports GNOME, Xfce and Openbox.'
arch=('any')
url='https://github.com/shimmerproject/Orion'
license=('GPL3')
depends=('gtk-engine-murrine')
makedepends=('git')
provides=('gtk-theme-orion')
conflicts=('gtk-theme-orion')
source=('git+https://github.com/shimmerproject/Orion.git')
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/Orion"
	echo $(git describe --always | sed 's|v||')git$(git log -1 --format="%cd" --date=short | sed 's|-||g').$(git rev-parse --short HEAD)
}

package() {
	cd "${srcdir}/Orion"
	install -d -m 755 "${pkgdir}/usr/share/themes/Orion"
	rm -rf {.git,.gitignore}
	cp -r . "${pkgdir}/usr/share/themes/Orion/"
}