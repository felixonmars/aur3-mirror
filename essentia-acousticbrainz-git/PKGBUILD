# Maintainer: Frederik "Freso" S. Olesen <freso.dk@gmail.com>
# Contributor: Johannes Dewender arch at JonnyJD dot net
# Contributor: Nils Werner <nils DOT werner AT gmail DOT com>
_pkgbasename='essentia'
_pkgname="$_pkgbasename-acousticbrainz"
pkgname="$_pkgname-git"
_python=python2
pkgver=2.1_beta1.r216.ge1b29eb
pkgrel=1
pkgdesc="audio analysis and audio-based music information retrieval for acousticbrainz"
url="http://essentia.upf.edu/"
arch=('x86_64' 'i686')
license=('GPL')
makedepends=('python2' 'git')
depends=('libyaml' 'fftw' 'ffmpeg' 'taglib' 'libsamplerate')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/MTG/$_pkgbasename.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgbasename"
    git describe --tags | sed -e 's/^v//' -e 's/-/.r/' -e 's/-/\./g'
}

build() {
    cd "$srcdir/$_pkgbasename"
    $_python waf configure \
	    --mode=release --prefix=/usr/ \
	    --with-example=streaming_extractor_music
    $_python waf --prefix=/usr/
}

package() {
    cd "$srcdir/$_pkgbasename"
    install -D build/src/examples/streaming_extractor_music \
	    $pkgdir/usr/bin/streaming_extractor_music
}
