# Maintainer: Adam Russell <adamlr6+arch@gmail.com>
# Contributor: ngoonee <n g    o o n    e e <at gmail.com, delete all spaces>>
pkgname=evolution-mapi-git
pkgver=20101020
_gnomever=0.32
pkgrel=1
pkgdesc="MAPI plugin for evolution."
arch=('i686' 'x86_64')
url="http://www.go-evolution.org"
license=('GPL3')
depends=('evolution>=0.32.0' 'openchange=0.10')
depends=('gnome-common' 'gtk-doc')
provides=('evolution-mapi')
options=(!makeflags)
_gitroot="git://git.gnome.org/evolution-mapi"
_gitname="evolution-mapi"
_gitbranch="gnome-2-32"
_prefix="/opt/samba4"

build() {
	cd "${srcdir}"

	if [ -d "${srcdir}/${_gitname}" ] ; then
		cd ${_gitname}
		git clean -f
		git reset --hard HEAD
		git pull --rebase || return 1
	else
		git clone ${_gitroot} || return 1
		cd ${_gitname}
		git checkout ${_gitbranch} || return 1
	fi

	export PKG_CONFIG_PATH=${_prefix}/samba/lib/pkgconfig:$PKG_CONFIG_PATH
	export PKG_CONFIG_PATH=${_prefix}/lib/pkgconfig:$PKG_CONFIG_PATH

	export CFLAGS="-DHAVE_MEMCTX_ON_CAST_SPROPVALUE -DHAVE_MEMCTX_ON_CAST_MAPI_SPROPVALUE ${CFLAGS}"
	./autogen.sh --prefix=${_prefix}
	unset CFLAGS

	make || return 1
}

package() {
	cd "${srcdir}/${_gitname}"

	make DESTDIR="$pkgdir/" install
}
