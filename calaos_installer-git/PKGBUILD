# Maintainer: Baptiste Grenier <baptiste@bapt.name>
pkgname=calaos_installer-git
_gitname=calaos_installer
pkgver=91.4a2a4ef
pkgrel=1
pkgdesc="Calaos Installer"
arch=('i686' 'x86_64')
url="http://calaos.fr"
license=('GPL3')
depends=('lua51' 'qt4')
makedepends=('git' 'libvmime-git')
source=("$_gitname::git+https://github.com/calaos/calaos_installer")
md5sums=('SKIP')

pkgver() {
	cd "$_gitname"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd "$srcdir/$_gitname"
	qmake-qt4
	make PREFIX=/usr
}

package() {
	cd "$srcdir/$_gitname"
	install -Dm755 "$_gitname" "$pkgdir/usr/bin/$_gitname" || return 1
}
