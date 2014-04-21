pkgname=fast-ct
pkgver="1.0"
pkgrel=1
pkgdesc="A lightweight but powerfull and fast C unit testing framework"
arch=('i686' 'x86_64')
url=('https://github.com/petrbel/fast-ct')
license=('MIT')
makedepends=('git')
source=(fast-ct::git+https://github.com/petrbel/fast-ct)
md5sums=('SKIP')
options=(staticlibs)

package() {
	cd $srcdir/fast-ct
	bin_dir=$pkgdir/usr/bin
	lib_dir=$pkgdir/usr/lib
	mkdir -p $bin_dir $lib_dir
	
	make
	make INSTALL_BIN_DIR="$bin_dir" INSTALL_LIB_DIR="$lib_dir" install
}

