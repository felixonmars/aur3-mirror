# Maintainer: John Schoenick <john@pointysoftware.net>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=lib32-alsa-plugins-git
pkgver=20110920
pkgrel=1
pkgdesc="Extra alsa plugins (32-bit) - Git version"
arch=(x86_64)
url="http://www.alsa-project.org"
license=(GPL)
depends=(lib32-alsa-lib-git alsa-plugins)
makedepends=(lib32-{libpulse,jack,speex,libsamplerate} gcc-multilib)
optdepends=('lib32-libpulse: PulseAudio plugin'
            'lib32-jack: Jack plugin'
            'lib32-libsamplerate: libsamplerate resampling plugin'
            'lib32-speex: libspeexdsp resampling plugin')
options=('!libtool')
source=()
provides=("lib32-alsa-plugins=1.0.24")
conflicts=('lib32-alsa-plugins')

_gitroot=git://git.alsa-project.org/alsa-plugins.git
_gitname=alsa-plugins

build() {
  cd "$srcdir"
  if [ -d $_gitname ] ; then
      ( cd $_gitname && git pull ) 
  else
    git clone $_gitroot
  fi
  
  rm -rf "${_gitname}_build"
  cp -r "${_gitname}"{,_build}
  cd "${_gitname}_build"
  
  autoreconf -v --force --install

  export CC="gcc -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./configure --prefix=/usr --libdir=/usr/lib32 --disable-avcodec
  make
}

package() {
  cd "$srcdir/${_gitname}_build"
  make DESTDIR="$pkgdir" install

  rm -r "$pkgdir/usr/share/alsa/alsa.conf.d/"
}
