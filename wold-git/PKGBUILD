# Maintainer: Tobias T. <OldShatterhand at gmx-topmail dot de>

pkgname=wold-git
pkgver=2013.12.29
pkgrel=1
pkgdesc="Very simple Wake-on-Lan packet handler with custom action execution"
arch=('i686' 'x86_64')
url=("https://github.com/pauliuszaleckas/wold")
license=('GPL')
depends=('glibc')
makedepends=('git')
source=('git://github.com/pauliuszaleckas/wold.git')
pkgver() {
	cd "$_gitname"
	git log -1 --format="%cd" --date=short | sed 's|-|.|g'
}

build() {
	mkdir "$srcdir/$_gitname/build_dir"
	cd "$srcdir/$_gitname/wold"
	make
}

package() {
	cd "$srcdir/$_gitname/wold"
	make DESTDIR="$pkgdir" install PREFIX=/usr
}
md5sums=('SKIP')
