# Maintainer: Dan Saul <aur dot cryingwolf at org>
pkgname=ude-emerald-theme
_datever=20100902
_miniver=1
pkgver=$_datever.$_miniver
pkgrel=1
pkgdesc="A theme for the emerald window manager."
arch=(any)
depends=('emerald')
license=('MIT')
source=(http://ude-emerald-theme.googlecode.com/files/$pkgname.src.$_datever.$_miniver.tar.xz)
url=('http://code.google.com/p/ude-emerald-theme/')
md5sums=('c22647dac000ae4caa842210e8dd4543')

build() {
	mkdir -p $pkgdir/usr/share/emerald/themes/UDE || return 1
	cp $srcdir/$pkgname/theme.ini $pkgdir/usr/share/emerald/themes/UDE || return 1
	cp $srcdir/$pkgname/theme.screenshot.png $pkgdir/usr/share/emerald/themes/UDE || return 1


##cd ${startdir}/pkg || return 1
#mkdir -p usr/share/emerald/themes || return 1
#cd usr/share/emerald/themes || return 1
#cp -r ${startdir}/Lantern .

}
