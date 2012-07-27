# Maintainer: 謝致邦<Yeking@Red54.com>

pkgname=aecium
pkgver=20120727
pkgrel=1
pkgdesc="Amtium eFlow Client for GNU/Linux"
arch=('i686' 'x86_64')
depends=('libpcap')
makedepends=('git' 'automake' 'autoconf' 'libtool')
url="http://gitorious.org/aecium"
license=('GPLv2')
source=('autogen.sh')
md5sums=('9f396eadae4b6548bfa1ea2d70974dfb')

_git="https://git.gitorious.org/aecium/mainline.git"
_gitdir=mainline

build() {
	cd $srcdir
	git clone $_git
	mv autogen.sh $_gitdir
	cd $_gitdir
	./autogen.sh
	
	./configure --prefix=/usr
	make
}
package(){
	cd ${srcdir}/$_gitdir
	make DESTDIR=${pkgdir} install
}
