# Maintainer: Krumelmonster <krumelmoster zoho.com>

pkgname=d-programming-deimos-glfw-git
_dname='GLFW2 and GLFW3'
_gitname='glfw'
pkgdesc="A static binding to $_dname for the D Programming Language."
pkgver=r26.7c67905
pkgrel=1
license=('glfw')
depends=(
	'd-compiler'
	'glfw'
)

arch=('any')
makedepends=('git')

url="https://github.com/D-Programming-Deimos/$_gitname"
provides=("d-programming-deimos-$_gitname")
source=("$_gitname::git://github.com/D-Programming-Deimos/$_gitname.git")

md5sums=('SKIP')

package() {
	mkdir -p "$pkgdir/usr/include/dlang/dmd/"
	cp -r "$_gitname/deimos/" "$pkgdir/usr/include/dlang/dmd/"
}

pkgver() {
	cd "$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}