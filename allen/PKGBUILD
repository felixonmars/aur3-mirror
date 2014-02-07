# submitter: perlawk
# Maintainer: perlawk

pkgname=allen
_pkgname=Allen
pkgver=svn
pkgrel=1
pkgdesc="A Lua library which provides a set of utilities and helpers for strings operations."
url="https://github.com/Yonaba/Allen"
arch=('x86_64' 'i686')
license=('GPLv3')
makedepends=('svn')

prepare() {
	cd ${srcdir}
	if [ ! -e ${_pkgname} ]; then
		svn co https://github.com/Yonaba/Allen
	fi
}

package() {
  cd "${srcdir}/${_pkgname}/trunk"
	mkdir -p "$pkgdir/usr/lib/lua/5.2"
	cp allen.lua "$pkgdir/usr/lib/lua/5.2"
}
