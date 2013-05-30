# Maintainer: Jonathan MASSUCHETTI <iletaitunefoisfenghuang@gmail.com>

pkgname="kio-upnp-ms-git"
pkgver=20111101
pkgrel=3
pkgdesc="UPnP MediaServer KIO-slave for the KDE platform"
arch=("x86 x86_64")
url="https://projects.kde.org/projects/playground/base/kio-upnp-ms"
license=('GPL')
depends=('herqq>=0.9' 'kdebase-runtime')
makedepends=('git' 'qt4' 'cmake' 'automoc4')
optdepends=('cagibi: UPnP system client')

_gitroot="git://anongit.kde.org/kio-upnp-ms"
_gitname="kio-upnp-ms"

build() {
	
	cd "$srcdir"
	msg "Connecting to GIT server...."
	
	if [[ -d "$_gitname" ]]; then
	cd "$_gitname" && git pull origin
	msg "The local files are updated."
	else
	git clone "$_gitroot" "$_gitname"
	fi
	
	msg "GIT checkout done or server timeout"
	msg "Starting build..."
	
	rm -rf "$srcdir/$_gitname-build"
	git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	cd "$srcdir/$_gitname-build"

	cmake -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	
	cd "$srcdir/$_gitname-build"
	make DESTDIR="$pkgdir/" install
}
