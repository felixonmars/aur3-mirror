pkgname=picard-bzr
pkgver=1054
pkgrel=1
pkgdesc="Next generation MusicBrainz tagging application (bzr version)"
arch=('i686' 'x86_64')
url="http://musicbrainz.org/doc/PicardTagger"
license=('GPL')
depends=('python2-qt' 'mutagen' 'libofa' 'ffmpeg')
optdepends=('libdiscid: CD-Lookup feature')
makedepends=('bzr')
provides=('picard')
conflicts=('picard' 'picard-qt')
_bzrtrunk=http://bazaar.launchpad.net/~musicbrainz-developers/picard/trunk
_bzrmod=picard
build() {
	cd $srcdir
	msg "Connecting to server..."
	if [ ! -d $_bzrmod ]; then
		bzr co $_bzrtrunk $_bzrmod
	else
		bzr up $_bzrmod
	fi
	msg "Bzr checkout done (or timeout)"
	cd $_bzrmod
	python2 setup.py config
	python2 setup.py install --root=$pkgdir
}
