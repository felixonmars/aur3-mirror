# Maintainer: Koncz László <konlaasz at gmail dot com>

pkgname=urxvt-perls-git
pkgver=107.6481d92
pkgrel=1
pkgdesc="Muennich's Perl extensions for the rxvt-unicode terminal emulator"
arch=('any')
url='https://github.com/muennich/urxvt-perls'
license=('GPL')
depends=('rxvt-unicode' 'xsel')
makedepends=('git')
conflicts=('urxvt-url-select' 'urxvt-keyboard-select' 'urxvt-clipboard')
install=urxvt-perls.install
source=('git+https://github.com/muennich/urxvt-perls.git')
sha1sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
	cd "${pkgname%-git}"
	install -Dm644 'clipboard' "${pkgdir}/usr/lib/urxvt/perl/clipboard"
	install -Dm644 'keyboard-select' "${pkgdir}/usr/lib/urxvt/perl/keyboard-select"
	install -Dm644 'url-select' "${pkgdir}/usr/lib/urxvt/perl/url-select"
	install -Dm644 'README.md' "${pkgdir}/usr/share/doc/urxvt-perls/README.md"
}
