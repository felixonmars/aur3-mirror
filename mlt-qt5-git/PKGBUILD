# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: IncredibleLaser
# Contributor: zuf <kontakt.zuf@gmail.com>
# Contributor: agapito <agapitofrndez@ozu.es>

pkgname=mlt-qt5-git
pkgver=v0.9.2.180.g23053fb
pkgrel=1
pkgdesc="An open source multimedia framework, designed and developed for television broadcasting. Special build with Qt5 Support (GIT Version)"
arch=(i868 x86_64)
url="http://www.mltframework.org/"
license=('GPL')
makedepends=('git' 'ladspa' 'frei0r-plugins' 'libdv' 'sdl_image' 'libsamplerate' 'sox' 'ffmpeg' 'vid.stab' 'qt5-svg' 'jack2' 'libexif')
optdepends=('sdl_image: for SDL plugin'
            'libsamplerate: for libavresample plugin'
            'sox: for SOX (Audio Swiss Army Knife) plugin'
            'ffmpeg: for ffmpeg plugin'
            'vid.stab: for video stabilize plugin'
            'qt5-svg: for Qt5 plugins'
            'jack2: for JACK sound output plugin'
            'libexif: for auto rotate plugin')
conflicts=('mlt' 'mlt++' 'mlt-qt5')
provides=('mlt' 'mlt-qt5')
source=('git+https://github.com/mltframework/mlt.git')
md5sums=('SKIP')

pkgver() {
  cd mlt
  echo "$(git describe --long --tags | tr - .)"
}

build() {
  cd mlt
  ./configure \
    --prefix=/usr \
    --enable-glp \
    --enable-glp3 \
    --enable-opengl \
    --disable-gtk2 \
    --avformat-vdpau \
    --qt-libdir=/usr/lib \
    --qt-includedir=/usr/include/qt
  make
}

package() {
  make -C mlt DESTDIR="${pkgdir}" install
}
