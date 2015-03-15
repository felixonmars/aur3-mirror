# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: IncredibleLaser
# Contributor: zuf <kontakt.zuf@gmail.com>
# Contributor: agapito <agapitofrndez@ozu.es>

pkgname=mlt-qt5
pkgver=0.9.6
pkgrel=2
pkgdesc="An open source multimedia framework, designed and developed for television broadcasting. Special build with Qt5 Support"
arch=(i868 x86_64)
url="http://www.mltframework.org/"
license=('GPL')
makedepends=('ladspa' 'frei0r-plugins' 'libdv' 'sdl_image' 'libsamplerate' 'sox' 'ffmpeg' 'vid.stab' 'qt5-svg' 'jack2' 'libexif')
optdepends=('sdl_image: for SDL plugin'
            'libsamplerate: for libavresample plugin'
            'sox: for SOX (Audio Swiss Army Knife) plugin'
            'ffmpeg: for ffmpeg plugin'
            'vid.stab: for video stabilize plugin'
            'qt5-svg: for Qt5 plugins'
            'jack2: for JACK sound output plugin'
            'libexif: for auto rotate plugin'
            'movit: for movit.luma module for opengl plugin')
conflicts=('mlt' 'mlt++')
provides=('mlt')
source=("http://downloads.sourceforge.net/sourceforge/mlt/mlt-${pkgver}.tar.gz")
sha1sums=('c14f32e76fe7e9b98cad37346396a9514a86e4a0')

build() {
  cd "mlt-${pkgver}"
  ./configure --prefix=/usr \
    --enable-gpl \
    --enable-gpl3 \
    --enable-opengl \
    --disable-gtk2 \
    --avformat-vdpau \
    --qt-libdir=/usr/lib \
    --qt-includedir=/usr/include/qt
  make
}

package() {
  make -C "mlt-${pkgver}" DESTDIR="${pkgdir}" install
}
