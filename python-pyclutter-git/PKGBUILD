# Maintainer: Jonathan Ryan <jryan@curious-computing.com>

pkgname=python-pyclutter-git
_ver=1.99.1
pkgver=1.99.1.r638.f8513bf
pkgrel=1
pkgdesc="Pythonic gobject introspection bindings for Clutter."
arch=('any')
url="https://git.gnome.org/browse/pyclutter"
license=('GPL')
depends=('pygobject-devel>=3.0', 'python>=3.1', 'clutter>=1.0', 'python-cairo>=1.10')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=('pyclutter', 'pyclutter-git')
source=("${pkgname%-git}::git+https://git.gnome.org/browse/pyclutter")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "${_ver}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./autogen.sh
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"
	make -k check
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
