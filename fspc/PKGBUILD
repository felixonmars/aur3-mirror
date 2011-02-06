# Contributor: Kvasthval
pkgname=fspc
pkgver=1.0.1
_altver=1_0_1
pkgrel=1
pkgdesc="Configuration tool for Sentelic touchpads."
arch=('i686' 'x86_64')
url=http://sourceforge.net/projects/fsp-lnxdrv/
license=('GPL')
makedepends=('cmake')
depends=('wxgtk')
source=(http://downloads.sourceforge.net/fsp-lnxdrv/fsp-lnxdrv-$pkgver-src.tar.gz)
md5sums=('493e8a786e16ff903ce829c38204fa80')

build()
{
	# Compiling libfsp first (required)
	cd $srcdir/release_$_altver/src/libfsp
	make lib || return 1

	# Compiling fspc
	cd $srcdir/release_$_altver/src/$pkgname
	cmake . || return 1
	make $pkgname || return 1

	# Installing fspc and resource files
	install -D -m0755 fspc $pkgdir/usr/bin/fspc || return 1
	install -D -m0644 fspcui.xrc $pkgdir/usr/share/$pkgname/fspcui.xrc || return 1
	install -D -m0644 pic/Acceleration.png $pkgdir/usr/share/$pkgname/pic/Acceleration.png || return 1
	install -D -m0644 pic/HEnabled.png $pkgdir/usr/share/$pkgname/pic/HEnabled.png || return 1
	install -D -m0644 pic/Logo.png $pkgdir/usr/share/$pkgname/pic/Logo.png || return 1
	install -D -m0644 pic/OpClick.png $pkgdir/usr/share/$pkgname/pic/OpClick.png || return 1
	install -D -m0644 pic/panelAcceleration.png $pkgdir/usr/share/$pkgname/pic/panelAcceleration.png || return 1
	install -D -m0644 pic/panelClickOnPad.png $pkgdir/usr/share/$pkgname/pic/panelClickOnPad.png || return 1
	install -D -m0644 pic/panelDeclaration.png $pkgdir/usr/share/$pkgname/pic/panelDeclaration.png || return 1
	install -D -m0644 pic/panelScrollOnPad.png $pkgdir/usr/share/$pkgname/pic/panelScrollOnPad.png || return 1
	install -D -m0644 pic/panelSwInfo.png $pkgdir/usr/share/$pkgname/pic/panelSwInfo.png || return 1
	install -D -m0644 pic/VEnabled.png $pkgdir/usr/share/$pkgname/pic/VEnabled.png || return 1
	install -D -m0644 pic/VHDisabled.png $pkgdir/usr/share/$pkgname/pic/VHDisabled.png || return 1
	install -D -m0644 pic/VHEnabled.png $pkgdir/usr/share/$pkgname/pic/VHEnabled.png || return 1
}
