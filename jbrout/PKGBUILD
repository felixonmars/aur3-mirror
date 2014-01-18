# Maintainer: Ennoia <ennoia at laposte dot net>
# Contributor: Kirt Lillywhite <kirt dot lillywhite at gmail dot com>
# Contributor: Jonathan Schaeffer <joschaeffer at gmail dot com>

pkgname=jbrout
pkgver=0.3.359
pkgrel=2
pkgdesc="A a photo manager with support for IPTC keywords"
arch=("i686" "x86_64")
url="http://code.google.com/p/jbrout/"
license=('GPL2')
depends=('python2' 'python2-lxml' 'pygtk' 'python2-imaging' 'fbida' 'jhead' 'python2-exiv2>=0.1.2' 'perl-image-exiftool')
#optdepends=('psyco2-svn')
provides=('jbrout')
conflicts=('jbrout-svn')
source=("http://jbrout.free.fr/download/sources/${pkgname}_${pkgver}.tar.gz")
md5sums=('5720aa58b76945501da66a5ed4d6ac5b')


build() {
	mkdir -p $pkgdir/usr/lib/
	cp -pr $srcdir/jbrout/jbrout/ $pkgdir/usr/lib/ || return 1
	sed -i 's/python/python2/1' $srcdir/jbrout/dist/data/jbrout
	install -D -m755 $srcdir/jbrout/dist/data/jbrout $pkgdir/usr/bin/jbrout
	install -D -m644 $srcdir/jbrout/dist/data/jbrout.desktop $pkgdir/usr/share/applications/jbrout.desktop
}
