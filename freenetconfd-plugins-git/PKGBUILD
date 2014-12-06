# Maintainer: Luka Perkov <luka.perkov@sartura.hr>

pkgname=freenetconfd-plugins-git
_gitname=freenetconfd-plugins
pkgver=r12.df5bf13
# commit df5bf13e69a221ae6fb31739d31f1c0c5b2d72ce
pkgrel=1
pkgdesc='add support for management of additional YANG models'
url='https://github.com/freenetconf/freesub.git'
arch=('i686' 'x86_64')
license=('GPLv2')
depends=('freenetconfd')
makedepends=('git' 'cmake' 'gcc' 'make')
source=('git+https://github.com/freenetconf/freenetconfd-plugins.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_gitname"

	cmake CMakeLists.txt \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DEXAMPLE_PLUGINS=ON

	make
}

package() {
	cd "$srcdir/$_gitname"

	make DESTDIR="$pkgdir" install
}

# burp -c system `ls freenetconfd-plugins-git-r*.src.tar.gz | sort | tail -n 1`
