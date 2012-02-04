# Maintainer: John Schoenick <john@pointysoftware.net>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Daniel Ehlers <danielehlers@mindeye.net>

pkgname=alsa-plugins-git
pkgver=20110826
pkgrel=1
pkgdesc="Extra alsa plugins - Git version"
arch=(i686 x86_64)
url="http://www.alsa-project.org"
license=(GPL)
depends=(alsa-lib-git)
makedepends=(libpulse jack)
optdepends=('libpulse: PulseAudio plugin'
            'jack: Jack plugin'
            'ffmpeg: libavcodec resampling plugin'
            'libsamplerate: libsamplerate resampling plugin'
            'speex: libspeexdsp resampling plugin')
options=('!libtool')

provides=('alsa-plugins=1.0.24')
conflicts=('alsa-plugins')

_gitroot=git://git.alsa-project.org/alsa-plugins.git
_gitname=alsa-plugins

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    ( cd $_gitname && git pull origin )
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi
  
  rm -rf "${_gitname}_build"
  cp -r "${_gitname}"{,_build}
  cd "${_gitname}_build"
  
  autoreconf -v --force --install
  
  ./configure --prefix=/usr \
  --disable-avcodec # Does not compile correctly in current -git, temporarily disabled
  make
}

package() {
  cd "$srcdir/${_gitname}_build"
  make DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir/usr/share/doc/$pkgname"
  install -m644 doc/README* doc/*.txt "$pkgdir/usr/share/doc/$pkgname/"
}
