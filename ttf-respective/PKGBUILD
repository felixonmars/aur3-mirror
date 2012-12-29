# Maintainer: Chipster Julien <julien dot chipster @ archlinux dot fr>

pkgname=ttf-respective
pkgver=1.0
pkgrel=1
pkgdesc="Arista font from dafont.com"
arch=('any')
url="http://www.dafont.com/respective.font"
license=('Free for personal use')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=($pkgname.zip::http://img.dafont.com/dl/?f=respective)
md5sums=('62cf91f0fe2beb367ec6a198a39caf59')

build() {
	install -Dm 644 $srcdir/Respective.ttf $pkgdir/usr/share/fonts/TTF/Respective.ttf || return 1
	install -Dm 644 $srcdir/Respective_Slanted.ttf $pkgdir/usr/share/fonts/TTF/Respective_Slanted.ttf || return 1
	install -Dm 644 $srcdir/Respective_Swashes.ttf $pkgdir/usr/share/fonts/TTF/Respective_Swashes.ttf || return 1
	install -Dm 644 $srcdir/Respective_Swashes_Slanted.ttf $pkgdir/usr/share/fonts/TTF/Respective_Swashes_Slanted.ttf || return 1
	install -Dm 644 $srcdir/License\ -\ READ\ THIS.txt $pkgdir/usr/share/licenses/ttf-respective/License\ -\ READ\ THIS.txt || return 1
}
