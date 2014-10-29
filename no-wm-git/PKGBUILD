#maintainer Boris Staletic <boris[dot]staletic[at]gmail[dot]com>
_pkgname="no-wm"
pkgname="${_pkgname}-git"
pkgrel=3
pkgver=42.bfae5dd
pkgdesc="A truly minimalistic window manager. Name stands for NO Window Manager."
arch=('i686' 'x86_64')
url="https://github.com/nickhaller/no-wm"
license=('CCO1.0')
makedepends=('git')
optdepends=('speckeysd: define keybindings'
	'dmenu: launch applications'
	'xdotool: window manipulator'
	'window: alternative for xdotool')
source=("git+git://github.com/patrickhaller/no-wm")
pkgver() {
  cd "${SRCDEST}/${_pkgname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
} 

package() {
    cd "${srcdir}/${_pkgname}"
	install -D -m644 x-alt-tab "${pkgdir}/usr/local/bin/x-alt-tab"
	install -D -m644 x-focus-manager "${pkgdir}/usr/local/bin/x-focus-manager"
	install -D -m644 x-move-resize "${pkgdir}/usr/local/bin/x-move-resize"
	install -D -m644 x-placement-manager "${pkgdir}/usr/local/bin/x-placement-manager"
	install -D -m644 x-session "${pkgdir}/usr/local/bin/x-session"
	install -D -m644 x-undecorate "${pkgdir}/usr/local/bin/x-undecorate"
	install -D -m644 x-window-list "${pkgdir}/usr/local/bin/x-window-list"
  	cat README
}
md5sums=('SKIP')
sha1sums=('SKIP')
sha256sums=('SKIP')
sha384sums=('SKIP')
sha512sums=('SKIP')
