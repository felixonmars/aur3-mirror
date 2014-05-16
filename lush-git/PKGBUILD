_pkgname=lush
pkgname=${_pkgname}-git
pkgver=9
pkgrel=1
pkgdesc='A shell written in Lua'
arch=('i686' 'x86_64')
url="https://github.com/stykr/${_pkgname}"
license=('MIT')
depends=('lua' 'lua-posix')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git://github.com/stykr/${_pkgname}.git")
sha1sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	echo $(git rev-list --count HEAD)
}

package() {
	cd "$srcdir/$_pkgname"
	install -D -m644 LICENSE "${pkgdir}/usr/share/${_pkgname}/LICENSE"
	install -D -m644 config.lush "${pkgdir}/usr/share/${_pkgname}/config.lush"
	install -D -m755 lush "${pkgdir}/usr/bin/lush"
}
