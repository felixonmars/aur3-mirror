# Maintainer: ifschleife <daniel@rahier.biz>

pkgname=lastfm-git
_gitname=lastfm-desktop
pkgver=2.1.36.0.gc5589a9
pkgrel=2
pkgdesc="The official Last.fm desktop application suite"
arch=('any')
url="http://www.last.fm/"
license=('GPL3')
depends=('ffmpeg' 'fftw' 'libgpod' 'liblastfm' 'libsamplerate' 'phonon' 'phonon-vlc' 'pkg-config' 'pulseaudio' 'qt4>4.8' 'qtwebkit' 'sqlite' 'zlib')
conflicts=("lastfm-desktop")
makedepends=('git')
source=("git+https://github.com/lastfm/$_gitname"
        lastfm-scrobbler.sh
        avcodec_frame.patch
        cast-bug.patch)
sha512sums=('SKIP'
         '44a4619c424bf5c6f1c828b1d0baefa8843a1e936fe3235243c7df16193cab48aa00823193d205eb76c4725875b5a7f2ee8ac2de6779fe69de6ff468480ce87d'
         'df698d39810e680e20b134144fdd5457b775e03821a232dfc157eb09e3389f51bdb9f3ab30162d0552dedab948a3ee8cec5633e90a01862e2a74ffbefd61a16e'
         '82825e93be4f3064c3e1ff1a8fd2748295bf05ad83aefa057c91bab9fa6217f2e86b9635c5854c9b3a8648f60286fdf736cdefe932fd35a54f1370bab6c95456')


pkgver() {
    cd $_gitname
    local ver="$(git describe --long)"
    printf "%s" "${ver//-/.}"
}

build() {
  cd "$srcdir/$_gitname"
  patch -p0 -i ../../avcodec_frame.patch
  patch -p0 -i ../../cast-bug.patch
  qmake-qt4 -r
  make
}

package() {
  cd "$srcdir/$_gitname"
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/lastfm
  cp app/client/Last.fm\ Scrobbler.css $pkgdir/usr/share/lastfm/scrobbler.css
  cp _bin/lastfm-scrobbler _bin/fingerprinter $pkgdir/usr/bin
  install -m755 $srcdir/lastfm-scrobbler.sh $pkgdir/usr/bin
}
