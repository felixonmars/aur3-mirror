# Maintainer: 謝致邦<Yeking@Red54.com>

pkgname=aecium
pkgver=20120904
pkgrel=1
pkgdesc="Amtium eFlow Client for GNU/Linux"
arch=('i686' 'x86_64')
depends=('libpcap')
makedepends=('git' 'automake' 'autoconf' 'libtool')
url="http://gitorious.org/aecium"
license=('GPLv2')
source=('aecium.patch')
md5sums=('6bddaf1f189f71651a5e15ff0889be75')

git=mainline

build() {
	cd $srcdir
	git clone https://git.gitorious.org/aecium/mainline.git
	mv aecium.patch $git
	cd $git
	patch -Np0 -i aecium.patch
	aclocal
	autoheader
	automake --add-missing
	autoconf
	./configure --prefix=/usr
	make
}
package(){
	cd $srcdir/$git
	make DESTDIR=$pkgdir install
}
