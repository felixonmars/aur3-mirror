# Contributor: John Gerritse (reaphsharc@gmail.com)

pkgname=eve
pkgver=000066
pkgrel=4
arch=('i686')
pkgdesc="The EVE Online native linux client."
url="http://www.eve-online.com/"
license=('custom')
depends=('libx11' 'python' 'gtk2' 'libglade' 'alsa-lib' 'libjpeg' 'pygtk' 'dbus-python' 'pycairo' 'pygobject')
options=('!strip')
install=(${pkgname}.install)
source=(http://ccp.vo.llnwd.net/o2/linux/$pkgname-$pkgver.tgz transgaming-eve-play.patch eve.install)
md5sums=('a99f06e952f0f4cd53641d43b5a9fb0f' '8c5ab5d68e4e6eff14b79eff297867ec' '5e14b943cc77f0ee1dbb47c25fc836fe')

build() {
	cd $srcdir
	cp -R usr $pkgdir
	rm -rf $pkgdir/usr/share/{applnk,appp*,gnome,icons}
	install -m 644 -D $pkgdir/usr/lib/eve/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
	cd $pkgdir/usr/lib/eve/icons/
	patch -p0 -i $srcdir/transgaming-eve-play.patch
	mkdir -p $pkgdir/usr/share/{applications,pixmaps}
	mv $pkgdir/usr/lib/eve/icons/*.desktop $pkgdir/usr/share/applications/
	mv $pkgdir/usr/lib/eve/icons/*.png $pkgdir/usr/share/pixmaps/
	rm -rf $pkgdir/usr/lib/eve/icons
}

