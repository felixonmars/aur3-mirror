#Maintainer: TingPing <tingping@tingping.se>
#Contributor: Gianni Vialetto <gianni at rootcube dot net>

pkgname=ldc-git
pkgver=20130506
pkgrel=1
pkgdesc='A LLVM based compiler for the D programming language'
arch=('i686' 'x86_64')
url='http://ldc-developers.github.com/ldc'
license=('BSD' 'GPL')
depends=('libconfig' 'llvm')
makedepends=('git' 'cmake')
provides=('ldc')
conflicts=('dmd' 'ldc')
source=('git://github.com/ldc-developers/ldc.git')
backup=('etc/ldc2.conf' 'etc/ldc2.rebuild.conf')
md5sums=('SKIP')
_gitname=ldc

build() {
	cd "$srcdir/$_gitname"
	
	msg 'Updating git submodules...'
	git submodule update --init
	
	msg 'Starting build...'
	cmake -DCMAKE_INSTALL_PREFIX='/usr' -DBUILD_SHARED_LIBS=ON .
	make
}

package() {
	cd "$srcdir/$_gitname"
	make DESTDIR="$pkgdir" install
}

