# Maintainer: murchik <mixturchik@gmail.com>
# Contributor: nmeum <nmeum-aur@8pit.net>

pkgname=uzbl-next-git
_gitname=uzbl
pkgver=r4134.6641953
pkgrel=2
pkgdesc="A web browser that adheres to the unix philosophy."
url="http://github.com/${_gitname}/${_gitname}"
license=("GPL")
arch=("i686" "x86_64")
depends=("webkitgtk" "python" "python-six")
optdepends=("socat: to interface with the socket" "dmenu: to run some of the example scripts"
	"zenity: to run some of the example scripts" "xclip: for clipboard related keybindings"
	"pygtk: for uzbl-tabbed")
makedepends=("git" "python-setuptools")
provides=("uzbl-core" "uzbl-browser" "uzbl-tabbed")
sconflicts=("uzbl-core" "uzbl-browser" "uzbl-tabbed" "uzbl-experimental-git" "uzbl-git")
source=("git://github.com/${_gitname}/${_gitname}.git#branch=next")
sha256sums=("SKIP")

prepare() {
	cd "${_gitname}"
	sed 's#--install-scripts=$(INSTALLDIR)/bin##g' < Makefile > /tmp/Makefile
	mv /tmp/Makefile Makefile
}

pkgver() {
	cd "${_gitname}"
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "${_gitname}"
	make PREFIX="/usr" DESTDIR="${pkgdir}"
}

package() {
	cd "${_gitname}"
	make install PREFIX="/usr" DESTDIR="${pkgdir}"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${_gitname}/README"
}
