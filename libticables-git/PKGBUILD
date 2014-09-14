# Maintainer: Aaron Abbott <aaron.abbott1@gmail.com>

pkgver=23
pkgname=libticables-git
pkgrel=1
pkgdesc="TI Link Cable Library, git version"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/tilp/"
license=('GPL')
depends=('git' 'libticonv-git' 'libusb' 'glib2')
conflics=('libticables')
provides=('libticables')
install=libticables.install
source=('69-libticables.rules')
md5sums=('2e38fe89764f129c567b06afbbdfdcd0')

_gitname="libticables"
_gitroot="git://git.code.sf.net/p/tilp/${_gitname}.git"

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."
	
	if [[ -d "$_gitname" ]]; then
		cd "$_gitname" && git pull origin
		msg "The local files are updated."
	else
		git clone "$_gitroot"
	fi
	
	msg "GIT checkout done or server timeout"
	msg "Starting build..."

	rm -rf "${srcdir}/${_gitname}-build"
	git clone "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
	cd "${srcdir}/${_gitname}-build"
	./configure --prefix="/usr" --enable-libusb10
	make ${MAKEFLAGS}
}

package() {
	cd "${srcdir}/${_gitname}-build"
	make DESTDIR="$pkgdir" install
	
	#udev rules
	install -m755 -d ${pkgdir}/etc/udev/rules.d
    install -m644 ${srcdir}/69-libticables.rules ${pkgdir}/etc/udev/rules.d/
}

pkgver () {
	echo $(git rev-list --count --all)
}
