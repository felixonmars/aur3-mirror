# Maintainer: Aelius Saionji
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Scytrin dai Kinthra <scytrin@gmail.com>
# Scrollback Patch: http://comments.gmane.org/gmane.comp.misc.suckless/13685

pkgname='st-essential-patches'
pkgver='20140208'
pkgrel=1
pkgdesc='st with scrollback and url launching patches'
url='http://git.suckless.org/st/'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
depends=('libxft')
optdepends=('dmenu: display and filter urls')
makedepends=('ncurses' 'libxext' 'git')
install='st-essential-patches.install'
source=('st-git-20140208.tar.gz'
	'st-scrollback.diff'
	'st-0.4.1-externalpipe.diff'
	'keybindings.diff')
md5sums=('bcfc88fca4cf33194cfe7ae4def3311d'
         'c8b7d887a3466c4953df6705778d4bb6'
         'a159d04cafa90d7e7cbb8d5f58d8d038'
         'fb37e8faaa31d177f9c009cfa50733d3')

provides=('st')
conflicts=('st')

prepare() {
	cd "$srcdir"/st-git-20140208
	sed \
		-e 's/CPPFLAGS =/CPPFLAGS +=/g' \
		-e 's/CFLAGS =/CFLAGS +=/g' \
		-e 's/LDFLAGS =/LDFLAGS +=/g' \
		-i config.mk
	patch -F3 -i "$srcdir"/st-scrollback.diff
	patch -i "$srcdir"/keybindings.diff
	patch --ignore-whitespace -i "$srcdir"/st-0.4.1-externalpipe.diff
	sed '/char font/s/".*"/"inconsolata:pixelsize=12"/' -i config.def.h
}

build() {
	cd "$srcdir"/st-git-20140208
	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
	cd "$srcdir"/st-git-20140208
	make PREFIX=/usr DESTDIR="${pkgdir}" TERMINFO="${pkgdir}/usr/share/terminfo" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
