# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Asa Marco <marcoasa90@gmail.com>

pkgname=rosegarden-svn
pkgver=13.06.13277
pkgrel=1
pkgdesc="Audio and MIDI sequencer, score editor - development branch, doesn't conflict with the old version"
arch=(i686 x86_64)
url=http://www.rosegardenmusic.com/
license=(GPL2)
depends=(dssi fftw liblrdf lirc-utils qt shared-mime-info)
makedepends=(imake subversion)
optdepends=('lilypond: notation display'
    'cups: printing support'
    'flac: FLAC codec output'
    'okular: print preview, or any other PDF viewer'
    'timidity++: MIDI playback, or any other softsynth'
    wavpack)
[[ $CARCH == "i686" ]] && optdepends+=('dssi-vst: win32 VST support')
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
install=$pkgname.install
source=($pkgname::svn://svn.code.sf.net/p/${pkgname%-*}/code/trunk/${pkgname%-*})
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
    echo $(grep AC_INIT $pkgname/configure.ac | grep -o '[0-9.]\+' | head -n1).$(svnversion "$SRCDEST"/$pkgname/)
}

build() {
    cd $pkgname/
    autoreconf -fi
    ./configure --with-qtdir=/usr --prefix=/usr
    make
    sed -ri 's:(Exec|Name|Icon)=rosegarden$:&-qt4:g' data/desktop/rosegarden.desktop
}

package() {
    cd "$pkgdir"
    install -d usr/bin
    install -d usr/share/{applications,pixmaps,$_name/{chords,examples,fonts,library,presets,styles}}
    make -C "$srcdir"/$pkgname DESTDIR="$pkgdir" install
}
