# Maintainer: KIV <kiv.apple@dgmail.com>
pkgname=mrim-prpl-git
pkgver=20130501
pkgrel=1
pkgdesc="Plugin for libpurple for support Mail.ru Agent protocol"
arch=("i686" "x86_64")
url="http://mrim-prpl.googlecode.com/"
license=('GPL')
groups=()
depends=("libpurple" "gtk2")
makedepends=("git" "")
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=

build() {
	cd "${srcdir}"
	msg "Downloading sources from Google Code GIT..."
	if [ -d "${srcdir}/mrim-prpl-git" ] ; then
		cd "./mrim-prpl-git"
		git pull origin
		msg "The local files updated."
   	else
		git clone https://code.google.com/p/mrim-prpl/ mrim-prpl-git
		cd "./mrim-prpl-git"
	fi
	msg "GIT checkout done or server timeout"
	aclocal -I /usr/share/aclocal && autoheader && autoconf && ./configure && make
}

package() {
	cd "${srcdir}/mrim-prpl-git"
	make DESTDIR="$pkgdir" install
}
