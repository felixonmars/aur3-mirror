# Contributor: farid abdelnour < farid at atelier-labs.org>

pkgname=shazam
pkgver=20070611
pkgrel=4
pkgdesc="Simple GUI for ffmpeg and ffmpeg2theora."
arch=('i686' 'x86_64')
url="http://estudiolivre.org/shazam"
depends=('ffmpeg' 'ffmpeg2theora' 'zenity')
license=('GPL')
source=(http://estudiolivre.org/repo/4636/4636_1010-$pkgname-$pkgver.tgz)
md5sums=('68ea66a854c566d678acf114beeb29ff')

build () {
	mkdir -p $pkgdir/usr/bin/
	mkdir -p $pkgdir/usr/share/applications
	mkdir -p $pkgdir/usr/share/pixmaps
	cd $startdir/src/usr/bin
	install -D -m755 shazam $pkgdir/usr/bin/shazam || return 1
	cd $startdir/src/usr/share/applications || return 1
	mv *.* $pkgdir/usr/share/applications || return 1
	cd $startdir/src/usr/share/pixmaps || return 1
	mv icon_shazam.svg $pkgdir/usr/share/pixmaps || return 1
}
