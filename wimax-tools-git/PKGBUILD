# Maintainer: Ivan Shapovalov <intelfx100 at gmail dot com>
pkgname=wimax-tools-git
pkgver=20120501
pkgrel=1
pkgdesc="WiMAX Low-Level userspace tools - unofficial GIT repository"
arch=('i686' 'x86_64')
url="http://lists.linuxwimax.org/pipermail/wimax"
license=('custom')
depends=('libnl1')
conflicts=('wimax-tools')
provides=('wimax-tools')

_gitroot='git://people.freedesktop.org/~dcbw/wimax-tools'
_gitname='wimax-tools'

build() {
	cd "${srcdir}"
	msg "Connecting to GIT server..."

	if [[ -d "$_gitname" ]]; then
		cd "$_gitname" && git pull origin
		msg "The local files are updated."
	else
		git clone --depth=1 "$_gitroot" "$_gitname"
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting build..."

	cd "${srcdir}"
	cp -rfuT "$_gitname" "$_gitname-build"
	cd "$_gitname-build"
	NOCONFIGURE=1 ./autogen.sh
	./configure --mandir=/usr/share/man --prefix=/usr
	make
}

package() {
	cd "${srcdir}/$_gitname-build"
	make DESTDIR=${pkgdir} install
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
