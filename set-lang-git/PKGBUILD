# Maintainer: LEW21 <lew21@xtreeme.org>

pkgname=set-lang-git
pkgver=20110508
pkgrel=1
pkgdesc="Language chooser"
arch=(i686 x86_64)
url="https://gitorious.org/set-lang"
license=('LGPL')
depends=('qt')

_gitroot=git://gitorious.org/set-lang/set-lang.git
_gitname=set-lang

build() {
	msg "Connecting to git.freedesktop.org GIT server...."

	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin && cd ..
		msg "The local files are updated."
	else
		git clone $_gitroot
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf $_gitname-build
	cp -rH $_gitname $_gitname-build
	cd $_gitname-build

	PREFIX=/usr ./configure

	make
}

package() {
	cd $_gitname-build

	make INSTALL_ROOT="${pkgdir}" install
}
