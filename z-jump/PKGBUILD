# Contributor: Kamil Stachowski <kamil.stachowski@gmail.com>

pkgname=z-jump
pkgver=20101219
pkgrel=1
pkgdesc="A continuation of semi clone of autojump"
url='http://github.com/rupa/z/tree/master'
arch=('i686' 'x86_64')
license=('GPL')
depends=()
makedepends=('git')
optdepends=()
provides=('z-jump')
conflicts=()
replaces=()
source=()
md5sums=()
install=z-jump.install

_gitname='z'
_gitroot='git://github.com/rupa/z.git'

build() {
	msg "Connecting to Git server..."
	if [ -d "$srcdir/$pkgname" ]; then
		cd "$srcdir/$pkgname" && git pull origin || return 1
	else
		git clone "$_gitroot" || return 1
	fi
	msg "Git checkout done or server timeout"
}

package() {
	install -D -m644 "$srcdir/$_gitname/z.sh" "$pkgdir/usr/share/$pkgname/z.sh"
	install -D -m644 "$srcdir/$_gitname/README" "$pkgdir/usr/share/$pkgname/README"
}
