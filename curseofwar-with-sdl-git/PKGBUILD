# Maintainer: Alexey < koiwai at yandex dot com >

pkgname=curseofwar-with-sdl-git
_gitname=curseofwar
pkgver=0.0.0
pkgrel=1
pkgdesc="A fast-paced RTS/Action game. This is the most complete package, includes both ncurses and SDL versions of the game."
arch=("i686" "x86_64")
url="http://a-nikolaev.github.io/curseofwar/"
license=('GPL')
depends=('ncurses' 'sdl')
conflicts=('curseofwar' 'curseofwar-git')
makedepends=('gcc' 'git')
source=('git://github.com/a-nikolaev/curseofwar.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd "$srcdir/$_gitname"
#	./configure --prefix=/usr
	make
  make SDL=yes
}

package() {
	cd "$srcdir/$_gitname"
	make DESTDIR="$pkgdir/" install
	make SDL=yes DESTDIR="$pkgdir/" install
}
