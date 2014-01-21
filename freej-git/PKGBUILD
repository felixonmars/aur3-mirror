# Contributor: fred_99 <bobrenard@free.fr>

pkgname=freej-git
pkgver=DP_presentation.831.gc62bb87
pkgrel=1
pkgdesc="Realtime video mixer and linear video editor."
arch=('i686' 'x86_64')
url="http://freej.dyne.org/"
license=('GPL3')
depends=('sdl' 'libpng' 'libvorbis' 'libtheora' 'sdl_ttf' 'sdl_gfx'
         'ffmpeg-compat' 'alsa-lib' 'fftw' 'jack2'
         'libjpeg' 'liblo' 'slang' 'libshout' 'python2' 'zip'
         'sdl_image' 'frei0r-plugins')
makedepends=('git' 'pkgconfig' 'qt5-base')
optdepends=("qt5-base: freej-qt")
conflicts=('freej')
source=("git://code.dyne.org/freej.git#branch=sound")
md5sums=(SKIP)
_gitname="freej"

pkgver () {
  cd "$_gitname"
  echo $(git describe --always | sed 's/-/./g')
}

build() {
  cd "$_gitname"
  export PYTHON=python2
  CPPFLAGS=""
  autoreconf -i
  ./configure --prefix=/usr --enable-static-mozjs \
    --enable-qt-gui \
   PKG_CONFIG_PATH=/usr/lib/ffmpeg-compat/pkgconfig/
  make
}

package() {
  cd "$_gitname"
  make DESTDIR="$pkgdir/" install
}


# vim:set ts=2 sw=2 et:
