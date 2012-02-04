# Maintainer: LEW21 <lew21@xtreeme.org>

pkgname=libwfd-git
pkgver=20110828
pkgrel=1
pkgdesc="OpenWF - Linux DRM-based implementation"
arch=(i686 x86_64)
url="http://cgit.freedesktop.org/~bnf/owfdrm/"
license=('LGPL')
depends=('mesa-full') # You need gbm, latest mesa-full provides it.
provides=("libwfd=1.0")
conflicts=('libwfd')

_gitroot="git://people.freedesktop.org/~bnf/owfdrm"
_gitname="owfdrm"

build() {
	msg "Connecting to the GIT server...."

	if [ -d $_gitname ] ; then
		cd $_gitname
		git pull origin
		cd ..
	else
		git clone $_gitroot $_gitname --depth=1
	fi

	msg "Creating build directory..."
	rm -rf $_gitname-build
	cp -rH $_gitname $_gitname-build

	msg "Starting build..."
	cd $_gitname-build

	./autogen.sh --prefix=/usr

	make
}

package() {
	cd $_gitname-build
	make DESTDIR="${pkgdir}" install
}
