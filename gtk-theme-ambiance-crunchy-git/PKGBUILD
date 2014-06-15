pkgname=gtk-theme-ambiance-crunchy-git
pkgver=5.420f6ea
pkgrel=1
pkgdesc='An ambiance-like theme (GTK+ 2 & 3) for Xfce4 and GNOME3.'
arch='any'
url='https://github.com/izmntuk/ambiance-crunchy'
license=GPL2
depends=('gtk-engine-murrine')
optdepends=(
	'gtk-engine-unico-bzr: ubuntu unico theme engine developer branch'
	'gtk-engine-unico: ubuntu unico theme engine')
makedepends=('git')
source=('git+https://github.com/izmntuk/ambiance-crunchy.git')
sha256sums=('SKIP')

pkgver() {
	cd ${srcdir}/ambiance-crunchy
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
	cd "${srcdir}/ambiance-crunchy/themes"

	mkdir -p ${pkgdir}/usr/share/themes/
	cp -R * ${pkgdir}/usr/share/themes/
}
