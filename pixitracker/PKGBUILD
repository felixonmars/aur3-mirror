# Contributor: Egor <kontakt.zuf(at)gmail.com>
pkgname=pixitracker
pkgver=1.4
pkgrel=1
pkgdesc="Simple and fun sample based tracker with minimalistic pixel interface"
url="http://warmplace.ru/soft/pixitracker/"
depends=('sdl')
makedepends=()
conflicts=()
arch=('any')
replaces=()
backup=()
source=("http://www.warmplace.ru/soft/pixitracker/pixitracker.zip"
		"pixitracker64.desktop"
		"pixitracker.desktop"
		"pixitracker.xpm")
md5sums=('b81bd5c4ed2986a438eb640cd575cc6b'
		 '7470b4264fddf8c5529fdae40c17569d'
		 '80627b4cf68f019c40b6d2c38b3e711c'
		 'edd14f4001c6b4e4df5df4d87d71f916')
license=('Other' )
install="pixitracker.install"

package() {
    install -d -m755 $pkgdir/usr/share/applications
    if test "$CARCH" == x86_64
		then
			cp pixitracker64.desktop $pkgdir/usr/share/applications/pixitracker.desktop
		else
			cp pixitracker.desktop $pkgdir/usr/share/applications/pixitracker.desktop
	fi
    cd $srcdir/$pkgname
    install -d -m755 $pkgdir/usr/lib/$pkgname/
    cp -dR $srcdir/$pkgname $pkgdir/usr/lib/
    cp $startdir/pixitracker.xpm $pkgdir/usr/lib/$pkgname/
}
