# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: noonov <noonov@gmail.com>
# Contributor: silenvx <czvziwzx at gmail.com> written two good patches: addon-term-option.patch addon-color-palette-configuration.patch
# Contributor: Dalrik: miscoloring-issue-on-colorsetting-escape-sequences.patch
# Contributor: Arthur Shevchenko <dekross@outlook.com>: fix-issue-with-infinality.patch
# Contributor: Izumi Natsuka modified one patch
pkgname=fbterm-patched
pkgver=1.7.0
pkgrel=6
pkgdesc='A fast terminal emulator for linux with frame buffer device or VESA video card. With some patches that fix some known problems'
arch=('armv6h' 'i686' 'x86_64')
url='http://code.google.com/p/fbterm/'
license=('GPL2')
conflicts=('fbterm')
provides=('fbterm')
depends=('gcc-libs' 'fontconfig')
makedepends=('gpm')
optdepends=('libx86: for VESA video card support' 'gpm: for mouse support')
install=fbterm.install
source=("https://mirrors.kernel.org/gentoo/distfiles/${pkgname%-*}-${pkgver}.tar.gz"
        'addon-term-option.patch'
        'addon-color-palette-configuration.patch'
        'miscoloring-issue-on-colorsetting-escape-sequences.patch'
        'fix-issue-with-infinality.patch')

md5sums=('c36bae75a450df0519b4527cccaf7572'
	 '2bbf2e07f19c7b1a39e71d26ea762e9d'
	 'f3b442f472b068cc10903818d99fa32d'
	 '4fc976631fcafd39fbee645d66dc4fe1'
	 '314067620e9f1005127f743b1b3f4855')

build() {
	cd "${srcdir}/${pkgname%-*}-${pkgver%.?}"
	patch -p1 -i "${srcdir}/addon-term-option.patch"
	patch -p1 -i "${srcdir}/addon-color-palette-configuration.patch"
	patch -p1 -i "${srcdir}/miscoloring-issue-on-colorsetting-escape-sequences.patch"
	patch -p1 -i "${srcdir}/fix-issue-with-infinality.patch"
	./configure --prefix=/usr --enable-gpm
	make
}

package() {
	cd "${srcdir}/${pkgname%-*}-${pkgver%.?}"
	install -Dm644 terminfo/fbterm "${pkgdir}/usr/share/terminfo/f/fbterm"
	make DESTDIR="${pkgdir}" TERMINFO="${pkgdir}/usr/share/terminfo" install
}
