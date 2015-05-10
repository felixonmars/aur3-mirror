# Maintainer: Krumelmonster <krumelmoster zoho.com>

pkgname=d-programming-deimos-cairo-git
_dname='Cairo'
_gitname='cairo'
pkgdesc="A static binding to $_dname for the D Programming Language."
pkgver=r18.65abfd3
pkgrel=1
license=('cairo')
depends=(
	'd-compiler'
	'cairo'
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