# Maintainer: Ellis Kenyo <elken.tdos at gmail.com>

pkgname=ttf-powerline-fonts-git
_gitname=powerline-fonts
pkgver=20131206
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
makedepends=('git')
url=('git://github.com/Lokaltog/powerline-fonts')
license=('Apache' 'custom:"OFL"' 'custom:"UFL"' 'custom:"DFL "')
pkgdesc="Patched fonts for Powerline users"
arch=('any')
source=('git+https://github.com/Lokaltog/powerline-fonts.git')
install=ttf-powerline-fonts-git.install

md5sums=('SKIP')

pkgver() {
	date +%Y%m%d
}

package() {

	cd $srcdir/$_gitname
	install -dm755 $pkgdir/usr/share/fonts/{TTF,OTF}
	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"

	find . -iname "*.ttf" -exec install -m644 {} "$pkgdir/usr/share/fonts/TTF" \;
	find . -iname "*.otf" -exec install -m644 {} "$pkgdir/usr/share/fonts/OTF" \;
	cp -vR --parents */*.txt "$pkgdir/usr/share/licenses/$pkgname"
}
