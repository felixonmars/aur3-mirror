# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Jan Fader <jan.fader@web.de>
# Contributor: SanskritFritz (gmail)
# Maintainer: Iven Hsu <ivenvd@gmail.com>

pkgname=fish-shell-implicit-cd-git
_gitname="fish-shell"
pkgver=2013.04.10
pkgrel=1
pkgdesc="User friendly shell intended mostly for interactive use, forked by ridiculousfish. Patched to use implicit cd like original version."
arch=('i686' 'x86_64' 'arm')
url="http://ridiculousfish.com/shell/"
license=("GPL" "LGPL" "BSD" "MIT")
depends=('ncurses' 'bc')
optdepends=('python: fish_update_completions and other tools')
makedepends=('doxygen' 'git')
provides=('fish' 'fish-shell')
conflicts=('fish' 'fish-shell')
install=fish-shell.install
source=('git://github.com/fish-shell/fish-shell.git'
        'implicit_cd.patch')
md5sums=('SKIP'
         '247afc247e6125c3a91b5682eb9978c1')

pkgver() {
	cd "$_gitname"
	git log -1 --format="%cd" --date=short | sed 's|-|.|g'
}

build() {
	cd "$srcdir/$_gitname"
    patch -p1 < "$srcdir"/implicit_cd.patch
	autoconf
	./configure --prefix=/usr --sysconfdir=/etc --docdir=/usr/share/doc/fish --without-xsel
	make
}

package() {
	cd "$srcdir/$_gitname"
	make DESTDIR="$pkgdir" install
}

