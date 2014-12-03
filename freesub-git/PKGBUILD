# Maintainer: Luka Perkov <luka.perkov@sartura.hr>

pkgname=freesub-git
_gitname=freesub
pkgver=r5.e2a7d6a
# commit e2a7d6a44db6a28e316065009f5291d2eb4532fc
pkgrel=1
pkgdesc='freesub is GPLv2 licensed stdin/stdout to/from tcp forwarding tool'
url='https://github.com/freenetconf/freesub.git'
arch=('i686' 'x86_64')
license=('GPLv2')
depends=('libubox-lua-git')
makedepends=('git' 'cmake' 'gcc' 'make' 'pkg-config')
source=('git+https://github.com/freenetconf/freesub.git')
install=freesub.install
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_gitname"

	cmake CMakeLists.txt \
		-DCMAKE_INSTALL_PREFIX=/usr

	make
}

package() {
	cd "$srcdir/$_gitname"

	make DESTDIR="$pkgdir" install
	ln -s /usr/bin/freesub $pkgdir/usr/bin/netconf
}

# burp -c system `ls freesub-git-r*.src.tar.gz | sort | tail -n 1`
