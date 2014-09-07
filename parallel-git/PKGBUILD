# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname='parallel-git'
_pkgname='parallel'
pkgver=MH370.81.g53883d3
pkgrel=1
pkgdesc='A shell tool for executing jobs in parallel. Git version.'
arch=('any')
url='http://www.gnu.org/software/parallel'
license=('GPL3')
depends=('perl')
makedepends=('git' 'perl-pod2pdf')
provides=('parallel')
conflicts=('parallel')
source=("git://git.savannah.gnu.org/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --always | sed 's|-|.|g' | tr -d '\200-\377'
}

build() {
	cd "$_pkgname"
	source /etc/profile.d/perlbin.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir" install
}
