# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
pkgname=ii-esu
pkgver=1.0a
pkgrel=3
pkgdesc="An inventive shooter game."
arch=('i686' 'x86_64')
url="http://hizuoka.web.fc2.com/game/ES/index_en.html"
license=('custom')
depends=('libgl' 'mesa' 'sdl_mixer')
makedepends=('gdc-bin')
source=(http://hizuoka.web.fc2.com/game/ES/ES_d.zip
	http://ftp.de.debian.org/debian/pool/main/i/ii-esu/ii-esu_1.0a.dfsg1-1.diff.gz
	ii-esu_script)
md5sums=('f1b45e7386c0a878352afa5c5df112a5'
         'a55a367f79d375a27d39ea0b3606de36'
         '84510f4d7019a3b93611ef09b465c1bd')
build() {

cd $startdir/src/ES_d
patch -p1 <../ii-esu*diff
while read x;do patch -p1 <debian/patches/"$x";done <debian/patches/series
make || return 1
sed -i s,\/usr\/games,\/usr\/bin,g $startdir/src/ES_d/debian/ii-esu.desktop
#sed -i s,Icon=ii-esu,Icon=ii-esu.xpm,g $startdir/src/ES_d/debian/ii-esu.desktop
install -D -m755 $startdir/src/ES_d/ii-esu $startdir/pkg/usr/share/ii-esu/ii-esu
install -D -m644 $startdir/src/ES_d/debian/ii-esu.desktop $startdir/pkg/usr/share/applications/ii-esu.desktop
install -D -m644 $startdir/src/ES_d/debian/ii-esu.xpm $startdir/pkg/usr/share/pixmaps/ii-esu.xpm
install -D -m644 $startdir/src/ES_d/debian/copyright $startdir/pkg/usr/share/licenses/ii-esu/copyright
install -D -m755 $startdir/src/ii-esu_script $startdir/pkg/usr/bin/ii-esu

}
