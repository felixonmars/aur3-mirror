# Maintainer: bitwave <aur [at] oomlu [d0t] de>

pkgname=songwriter
pkgver=0.3
pkgrel=1
pkgdesc="Song Writer allows the editing of all the individual pieces of the Sound Helix XML document"
arch=("any")
url="http://www.abberkeep.us/projects/songWriter/songWriter.php"
groups=('multimedia')
license=('GPL')
optdepends=('soundhelix')
depends=('java-runtime' 'bash')
provides=('songwriter')
conflicts=('songwriter')
source=('http://www.abberkeep.us/projects/songWriter/SongWriter-0.3.zip' songwriter)
md5sums=('7eeefb199616dca23ad2ff9d285bea3e'
         'd6b53c5c56199f625714ea8c2f06e056')

package() {
	cd "$srcdir"
	install -Dm 644 SongWriter.jar ${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar
	install -Dm 755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
