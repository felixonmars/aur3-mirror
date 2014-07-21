# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Matthew Hiles <matthew.hiles@gmail.com>
pkgname=dump1090-robb
pkgver=git
pkgrel=1
epoch=
pkgdesc="Github pull of Malcolm Robb's fork of dump1090."
arch=(any)
url="https://github.com/MalcolmRobb/dump1090"
license=('GPL')
groups=()
depends=(rtl-sdr)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=()
md5sums=()

prepare() {
	cd "$srcdir"
	wget https://github.com/MalcolmRobb/dump1090/archive/master.zip
	unzip master.zip
}

build() {
	cd "$srcdir/dump1090-master"
	sed -ie '/^CFLAG/s@$@ -DHTMLPATH=\\"/srv/dump1090\\"@' Makefile
	make
}

check() {
	true
}

package() {
	cd "$srcdir/dump1090-master"
	mkdir -p "$pkgdir/srv/dump1090"
	mkdir -p "$pkgdir/usr/bin"
	install -o root -g root {dump,view}1090 "$pkgdir/usr/bin"
	cp -r public_html/* "$pkgdir/srv/dump1090"
}
