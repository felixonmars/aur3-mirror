# Maintainer: Adam Russell <adamlr6+arch@gmail.com>
pkgname=ruby-rip-git
pkgver=20101013
pkgrel=1
pkgdesc="Next generation packaging system for Ruby"
arch=('i686' 'x86_64')
url="http://hellorip.com/"
license=('MIT')
depends=('ruby')
makedepends=('git' 'ronn')
provides=('ruby-rip')

_gitroot="git://github.com/defunkt/rip.git"
_gitname="rip"

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
	fi

	rake man:build
	mkdir -p ${pkgdir}/usr/share/man/man1
	mkdir -p ${pkgdir}/usr/share/man/man5
}

package() {
	local _sitedir="$(ruby -e'puts $:.grep(/site_ruby[\/\\][\d.]+$/)[0]')"
	local _libdir="${pkgdir}${_sitedir}"
	local _bindir="${pkgdir}/usr/bin"

	cd "${srcdir}/${_gitname}"
	rake BINDIR="${_bindir}" LIBDIR="${_libdir}" install || return 1
	install -m644 -t ${pkgdir}/usr/share/man/man1 \
	              ${srcdir}/${_gitname}/man/*.1 || return 1
	install -m644 -t ${pkgdir}/usr/share/man/man5 \
	              ${srcdir}/${_gitname}/man/*.5 || return 1
}
