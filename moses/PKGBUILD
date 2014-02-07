# submitter: perlawk
# Maintainer: perlawk

pkgname=moses
_pkgname=Moses
pkgver=svn
pkgrel=1
pkgdesc="A Lua utility library which provides a set of helpers acting as shortcuts for common programming tasks, and support for functional programming"
url="https://github.com/Yonaba/Moses"
arch=('x86_64' 'i686')
license=('GPLv3')
makedepends=('svn')

prepare() {
	cd ${srcdir}
	if [ ! -e ${_pkgname} ]; then
		svn co https://github.com/Yonaba/${_pkgname}
	fi
}

package() {
  cd "${srcdir}/${_pkgname}/trunk"
	mkdir -p "$pkgdir/usr/lib/lua/5.2"
	cp *lua "$pkgdir/usr/lib/lua/5.2"
}
