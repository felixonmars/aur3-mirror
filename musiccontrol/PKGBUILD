pkgname="musiccontrol"
pkgver="0.3"
pkgrel="1"
pkgdesc="An advanced music player"
url="http://borderworlds.dk/projects/#mc"
license="GPL"
depends=('mpg321' 'vorbis-tools' 'simplemod' 'j2re')
source=(http://borderworlds.dk/projects/mc/MusicControl-0.3.jar \
        http://relax.frac.dk/mc/musiccontrol)

build() {
	mkdir -p $startdir/pkg/usr/share/musiccontrol
	cp $startdir/src/MusicControl-$pkgver.jar $startdir/pkg/usr/share/musiccontrol
	mkdir -p $startdir/pkg/usr/bin/
	chmod +x $startdir/src/musiccontrol
	cp $startdir/src/musiccontrol $startdir/pkg/usr/bin
}

md5sums=('be86fe0af4e998d090b1ced8056783e2' '16cad423ec4a892f434b977ed76fe916')
