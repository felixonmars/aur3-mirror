# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Nathan Owe <ndowens04+AUR@gmail.com>
# Contributor: Brett Bohnenkamper <kittykatt@silverirc.com>

pkgname=youtube-pl
pkgver=2012.01.08
pkgrel=1
pkgdesc="Play YouTube videos from command-line"
arch=('i686' 'x86_64')
url="http://ronja.twibright.com/youtube-pl.php"
license=('GPL3')
depends=('python2' 'mplayer')
source=('http://ronja.twibright.com/utils/youtube-pl')
md5sums=('b369c3460bc83395cf31f42da5aa686f')

package() {
	cd $srcdir/
	install -d $pkgdir/usr/bin
	install -m755 youtube-pl $pkgdir/usr/bin
	sed -i -e 's|python|python2|g' $pkgdir/usr/bin/youtube-pl
}
