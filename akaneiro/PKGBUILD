# Maintainer: kozec <kozec at kozec dot com>

pkgname=akaneiro
pkgver=b0d4387
pkgrel=1
pkgdesc="Akaneiro game launcher"
arch=('i686' 'x86_64')
url="http://spicyhorse.com"
license=('custom')
depends=('boost-libs' 'glibc' 'gcc-libs' 'qt4' 'libx11' 'glu' 'libgl'
		'libtorrent-rasterbar>=1:0.16.10' 'bzip2' 'libxext')
makedepends=('git' 'perl')
source=('git://github.com/SpicyHorse/launcher.git' "akaneiro.png" "akaneiro.patch" "akaneiro.i686.patch" "akaneiro-launcher.desktop")
_gitname="launcher"

pkgver() {
	cd "$srcdir"
	cd $_gitname
	# Use the tag of the last commit
	git describe --always | sed 's|-|.|g'
}

build() {
	cd "$srcdir"
	cd $_gitname
	if [ $CARCH == x86_64 ] ; then
		patch -Np0 -i "../akaneiro.patch" || return 1
	else
		patch -Np0 -i "../akaneiro.i686.patch" || return 1
	fi
	qmake || return 1
	make || return 1
}  

package() {
	cd "$pkgdir"
	mkdir -p "usr/share/applications"
	mkdir -p "usr/bin/"
	cp -R "$srcdir/launcher/tests/game_config" "usr/share/akaneiro-launcher"
	install -m 755 "$srcdir/launcher/launcher" "usr/bin/akaneiro-launcher"
	install -m 644 "$srcdir/akaneiro-launcher.desktop" "usr/share/applications/akaneiro-launcher.desktop"
	install -m 644 "$srcdir/akaneiro.png" "usr/share/akaneiro-launcher"
}

__package() {
	cd "$pkgdir"
	tar xvfz "$srcdir/data.tar.gz" || return 1
	mkdir -p "usr/lib/akaneiro"
	mv "usr/bin/akaneiro-launcher" "usr/lib/akaneiro/akaneiro-launcher" 
	install -m0755 "$srcdir/launcher" "usr/bin/akaneiro-launcher"
	ln -s "/usr/lib/libboost_system.so" "usr/lib/akaneiro/libboost_system.so.1.49.0"
	ln -s "/usr/lib/libboost_system.so" "usr/lib/akaneiro/libboost_system.so.1.52.0"
	ln -s "/usr/lib/libboost_system.so" "usr/lib/akaneiro/libboost_system.so.1.53.0"
}

md5sums=('SKIP'
         '7b56542592e679d9c4d44d79e21d5d0f'
         'bd0c684af82eb3e2bd7276d061d35d4b'
         '6fccf7e0498306c339e009477df866f4'
         'c25069afd283a5c4825a177724d5a9a0')
