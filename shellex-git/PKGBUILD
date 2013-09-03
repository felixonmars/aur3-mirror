#Maintainer: Johannes Visintini <arch at joker234.de>
pkgname=shellex-git
pkgver=0.1
pkgrel=1
pkgdesc='shell-based launcher'
arch=('i686' 'x86_64')
url='https://github.com/Merovius/shellex'
license=('BSD')
depends=('rxvt-unicode' 'zsh' 'perl-x11-protocol' 'xorg-xrandr')
makedepends=('wget' 'asciidoc' 'docbook-xsl' 'tar')
source=('git://github.com/Merovius/shellex')
sha1sums=('SKIP')
conflicts=('shellex')

_gitname='shellex'

build() {
	cd "$_gitname"
	make
	make -C doc/man
}

package() {
	cd "$_gitname"
	make DESTDIR="$pkgdir/" install

	install -Dm644 doc/man/shellex.1 \
		${pkgdir}/usr/share/man/man1/shellex.1

	install -Dm644 LICENSE \
		${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

	make clean
}
