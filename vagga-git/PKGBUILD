# Maintainer: Roman Rader <antigluk@gmail.com>
pkgname=vagga-git

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgver=v0.2.5.r39.g410bb06
pkgrel=1
pkgdesc="Vagga is a containerisation tool without daemons"
arch=('i686' 'x86_64')
url="http://vagga.readthedocs.org"
license=('MIT')
depends=('shadow' 'glibc-static')
makedepends=('rust' 'git' 'make')
checkdepends=()
optdepends=('linux-user-ns-enabled: kernel with CONFIG_USER_NS enabled')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=vagga.install
changelog=
source=("$pkgname::git+https://github.com/tailhook/vagga.git#branch=master")
noextract=()
md5sums=('SKIP')

prepare() {
	cd "$pkgname"
	git submodule update --init
}

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	make install DESTDIR="$pkgdir" PREFIX=/usr
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
