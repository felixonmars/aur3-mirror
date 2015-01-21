# Maintainer: Filip Bartholdy <filip_kemuel@yahoo.dk>

pkgname=ttf-ms-libre-fonts
pkgver=0.5.5
pkgrel=2
pkgdesc="Linking Core Microsoft TTF Fonts to different free fonts."
arch=('any')
url="http://www.ampsoft.net/webdesign-l/WindowsMacFonts.html"
license=('CC BY-SA')
depends=('fontconfig' 'ttf-linux-libertine' 'ttf-inconsolata' 'ttf-droid' 'ttf-liberation' 'ttf-dejavu' 'gsfonts')
conflicts=('ttf-ms-fonts' 'fake-ms-fonts')
provides=('ttf-ms-fonts')
source=('56-ttf-ms-libre-fonts.conf' 'fonts.tar.gz')

package() {
	install -D -m0644 ${srcdir}/56-ttf-ms-libre-fonts.conf ${pkgdir}/etc/fonts/conf.avail/56-ttf-ms-libre-fonts.conf
	install -d ${pkgdir}/etc/fonts/conf.d/
	ln -s /etc/fonts/conf.avail/56-ttf-ms-libre-fonts.conf ${pkgdir}/etc/fonts/conf.d/56-ttf-ms-libre-fonts.conf
	install -d ${pkgdir}/usr/share/fonts/TTF/
	install -D -m0644 ${srcdir}/fonts/Matthan\ Sans\ Regular.ttf ${srcdir}/fonts/Matthan\ Sans\ Italic.ttf ${srcdir}/fonts/Stanberry.ttf ${pkgdir}/usr/share/fonts/TTF/
	install -D -m0644 ${srcdir}/fonts/licence.md ${pkgdir}/usr/share/fonts/
}

sha256sums=('cb039f20f84b20cb82fcb1367aa67aaa4020c0c013559dac488f1224f8b4c26c'
	    '9f800799395050617a65eb6acd91aec4267cf8d8dc32ae913646b09ce901d9cb')
