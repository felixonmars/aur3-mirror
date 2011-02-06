# Contributor: Hauke Wesselmann <hauke@h-dawg.de>
pkgname=msynctool-unstable
pkgver=0.38
pkgrel=1
pkgdesc="CLI interface to the opensync synchronization framework"
url="http://www.opensync.org"
license=(GPL)
arch=('i686' 'x86_64')
depends=('libopensync-unstable')
replaces=('msynctool')
conflicts=('msynctool')
provides=('msynctool=0.37')
makedepends=('python' 'cmake')
source=(http://www.opensync.org/download/releases/$pkgver/msynctool-$pkgver.tar.bz2)
md5sums=('495c45d6f12d3523a736864b0ced6ce5')

build() {
	cd $srcdir/
  	mkdir build
    	cd build
      	cmake ../msynctool-$pkgver -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release

        make VERBOSE=1 || return 1
	make DESTDIR=$pkgdir install || return 1
}

