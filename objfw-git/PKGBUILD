# Maintainer: Florian Zeitz <florob at babelmonkeys dot de>

pkgname=objfw-git
pkgver=20130402
pkgrel=1
pkgdesc="A portable framework for the Objective C language."
arch=('i686' 'x86_64')
url="https://webkeks.org/objfw"
license=('custom:QPL' 'GPL2' 'GPL3')
provides=('objfw')
conflicts=('objfw')
replaces=('libobjfw-hg' 'objfw-hg')
depends=('sh' 'gcc-libs')
makedepends=('git' 'clang')

source=('git+https://webkeks.org/git/objfw.git')
md5sums=('SKIP')
_gitname=objfw


pkgver() {
  date +"%Y%m%d"
}
 
build() {
	cd "$srcdir/$_gitname"
	./autogen.sh
	./configure --prefix=/usr OBJC="clang"
	make
}

package() {
	cd "$srcdir/$_gitname"
	make DESTDIR=${pkgdir} install

	install -Dm644 LICENSE.QPL "$pkgdir/usr/share/licenses/$pkgname/LICENSE.QPL"
}

# vim:set ts=2 sw=2 et:
