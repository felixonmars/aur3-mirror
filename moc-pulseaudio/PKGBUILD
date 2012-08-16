# Maintainer: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>
# Contributor: Eric Bélanger <eric@archlinux.org> (original PKGBUILD in [extra])

pkgname=moc-pulseaudio
pkgver=20120224
pkgrel=1
pkgdesc="An ncurses console audio player with support for the mp3, ogg, and wave formats with a experimental patch for pulseaudio support"
arch=('i686' 'x86_64')
url="http://moc.daper.net/"
license=('GPL')
depends=('libmad' 'libid3tag' 'jack' 'curl' 'libltdl' 'file' 'libpulse')
makedepends=('speex' 'ffmpeg' 'taglib' 'libmpcdec' 'wavpack' 'libmodplug')
optdepends=('speex: for using the speex plugin' 
	    'ffmpeg: for using the ffmpeg plugin'
	    'taglib: for using the musepack plugin' 
	    'libmpcdec: for using the musepack plugin' 
            'wavpack: for using the wavpack plugin' 
	    'libmodplug: for using the modplug plugin')
conflicts=('moc')
provides=("moc=${pkgver}")
options=('!libtool')
source=(ftp://ftp.archlinux.org/other/moc/moc-${pkgver}.tar.xz{,.sig}
        moc-pulse-v3.patch)
sha1sums=('8ad3521d99fe6f2514907088c70e50c84ec09b46'
          'e8b2396d99692b0c4f85971d3fa6f5aecb1eb9d3'
          'ab257dcb8dd130cb5f4e41f5686c27def6aac765')

# source PKGBUILD && mksource
mksource() {
  [[ -x /usr/bin/svn ]] || (echo "svn not found. Install subversion." && return 1)
  _svnver=2412
  _svntrunk="svn://daper.net/moc/trunk"
  _svnmod="moc-${pkgver}"
  mkdir moc-${pkgver}
  pushd moc-${pkgver}
  svn co ${_svntrunk} --config-dir ./ -r ${_svnver} ${_svnmod}
  find . -depth -type d -name .svn -exec rm -rf {} \;
  tar -cJf ../moc-${pkgver}.tar.xz moc-${pkgver}/*
  popd
  rm -r moc-${pkgver}
  gpg --detach-sign --use-agent -u ${GPGKEY} moc-${pkgver}.tar.xz
}

build() {
  cd "${srcdir}/moc-${pkgver}"

  patch -Np1 -i ${srcdir}/moc-pulse-v3.patch

# Disabling aac to use the external ffmpeg to play them (FS#13164)
  autoreconf -i
  ./configure --prefix=/usr --without-rcc --without-aac \
    --with-oss  --with-alsa  --with-jack --with-mp3 \
    --with-musepack --with-vorbis --with-flac --with-wavpack \
    --with-sndfile --with-modplug --with-ffmpeg --with-speex \
    --with-samplerate --with-curl --disable-debug
  make
}

package() {
  cd "${srcdir}/moc-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
