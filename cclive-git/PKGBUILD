# Maintainer: barrikad <barrikad at bahnhof se>
# Contributor: N30N <archlinux at alunamation com>
pkgname=cclive-git
pkgver=v0.9.3.r0.9f77d01
pkgrel=3
pkgdesc="Commandline downloader for popular video websites."
arch=('i686' 'x86_64')
url="http://cclive.sourceforge.net/"
license=('AGPL3')
depends=('boost-libs' 'pcre' 'curl' 'glibmm' 'libquvi' 'asciidoc')
makedepends=('git' 'boost')
conflicts=('cclive' 'cclive-git')
provides=('cclive')
source=('cclive::git+https://github.com/legatvs/cclive.git'
	'iostream.patch'
	'subdir-objects.patch')
sha256sums=('SKIP'
            '4dd298a464add184cb297077554b827d85e16e441539ce13d783fb3d938c4b37'
            '051826ffc15326912b585016278ebaa8ae27a6c4abbaeada9fb69d615b6fd158')
install=cclive-git.install

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	patch -p1 -i "../../iostream.patch"
	patch -p1 -i "../../subdir-objects.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./bootstrap.sh
	./configure --prefix=/usr boost_cv_rpath_link_ldflag="-L/usr/lib"
	make
} 

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
