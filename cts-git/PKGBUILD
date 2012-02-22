# Maintainer: Jonathan Frawley <jonathanfrawley@gmail.com>

pkgname=cts-git
pkgver=0.2
pkgrel=1
pkgdesc="A pomodoro timer for people who use xmonad and xmobar."
arch=('i686' 'x86_64')
url="https://github.com/df3n5/chronos_server"
license=('GPL')
groups=()
depends=('boost')
makedepends=('cmake' 'boost' 'git')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_giturl="git://github.com/df3n5/chronos_server.git"

build() {
	cd "$srcdir"
	git clone ${_giturl}

	mkdir -p build/unix
	cd build/unix
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE:STRING=Release ../../chronos_server/src || return 1
	make || return 1
	chmod a+x ctc
	chmod a+x cts
	make DESTDIR=${pkgdir} install || return 1
	mkdir -p ${pkgdir}/etc/rc.d
	cp $srcdir/chronos_server/src/ctBash/ct-server ${pkgdir}/etc/rc.d/ct-server
	chmod a+x ${pkgdir}/etc/rc.d/ct-server
}
