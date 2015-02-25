# Maintainer: Sebastian Bresin <bresinse@campus.tu-berlin.de>

pkgname=equalx-bzr
pkgver=r80
pkgrel=1
pkgdesc="easily write equations in LaTeX and preview them in real-time."
url="https://launchpad.net/equalx"
arch=('i686' 'x86_64')
depends=("qt5-base" "exempi" "texlive-bin" "poppler")
makedepends=('bzr')
optdepends=("ghostscript: to export pdf and ps")
provides=('equalx')
conflicts=('equalx')
license=("GPL3")
_bzrmod="equalx"
source=("$_bzrmod::bzr+https://code.launchpad.net/~q-quark/equalx/0.x"
	"resources.patch"
	"qmake-install.patch"
	"icon.patch")
md5sums=('SKIP'
         'ff8cdbb195f8c3e65e6d7fd99533aaa6'
         'c8d351a7d424ffbe5d367399ee8ae1ba'
         '4d5cd2225c081d09e9e37f817f82ddd3')
install=equalx.install



pkgver() {
  cd $srcdir/$_bzrmod
  printf "r%s" "$(bzr revno)"
}

prepare() {
	cd "$srcdir/$_bzrmod"
	patch -p1 -i "$srcdir/resources.patch"
	patch -p1 -i "$srcdir/qmake-install.patch"
	patch -p1 -i "$srcdir/icon.patch"
}

build() {
	cd "$srcdir/$_bzrmod"
	qmake-qt5 $_bzrmod.pro
	make
}
package() {
	cd "$srcdir/$_bzrmod"
	make INSTALL_ROOT="$pkgdir" install
	install -Dm755 resources/equalx.desktop \
		"$pkgdir"/usr/share/applications/equalx.desktop
	for _size in 16 22 24 32 48 64 128; do
		install -Dm644 resources/icons/equalx/equalx-${_size}x${_size}.png \
			"$pkgdir"/usr/share/icons/hicolor/${_size}x${_size}/apps/equalx-icon.png
	done
	install -Dm655 resources/icons/equalx/equalx.svg \
		"$pkgdir"/usr/share/icons/hicolor/scalable/apps/equalx.svg
	mkdir	"$pkgdir"/usr/share/equalx
	cp -R 	resources \
		"$pkgdir"/usr/share/equalx/resources
	chmod -R 655 "$pkgdir"/usr/share/equalx/resources
}
