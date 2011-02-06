# Maintainer: Adam Russell <adamlr6+arch@gmail.com>
pkgname=ruby-rip
pkgver=0.0.5
pkgrel=4
pkgdesc="Next generation packaging system for Ruby"
arch=('i686' 'x86_64')
url="http://hellorip.com/"
license=('MIT')
depends=('ruby')
source=(http://github.com/defunkt/rip/tarball/v${pkgver})
md5sums=('0e5a06ee41fa5c9c3d3b4b946984cd21')

build() {
	:
}

package() {
	cd "${srcdir}"

	local _sitedir="$(ruby -e'puts $:.grep(/site_ruby[\/\\][\d.]+$/)[0]')"
	local _libdir="${pkgdir}${_sitedir}"
	local _bindir="${pkgdir}/usr/bin"
	local _srcname=`tar -tf v${pkgver} | head -n 1 | xargs basename`

	mkdir -p "${_libdir}"
	mkdir -p "${_bindir}"

	cd "${_srcname}"
	ruby setup.rb --libdir="${_libdir}" --bindir="${_bindir}" || return 1
}
